/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

protocol ScrollViewControllerDelegate {
    var viewControllers: [UIViewController] { get }
    var initialViewController: UIViewController { get }
    func scrollViewDidScroll()
}

class ScrollViewController: UIViewController {
  
    // MARK: - Properties
    var scrollView: UIScrollView {
    return view as! UIScrollView
    }

    var pageSize: CGSize {
    return scrollView.frame.size
    }

    var viewControllers: [UIViewController]!
    
    var delegate: ScrollViewControllerDelegate!
  
    // MARK: - View Life Cycle
    override func loadView() {
    let scrollView = UIScrollView()
    scrollView.bounces = false
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.delegate = self
    scrollView.isPagingEnabled = true
    scrollView.isScrollEnabled = true
    view = scrollView
    view.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewControllers = delegate.viewControllers
        configureScrollView()
    }

    func configureScrollView() {
        for (index, controller) in viewControllers.enumerated() {
            addChild(controller)
            controller.view.frame = frame(for: index)
            scrollView.addSubview(controller.view)
            controller.didMove(toParent: self)
        }
        
        scrollView.contentSize = CGSize(width: pageSize.width * CGFloat(viewControllers.count), height: pageSize.height)
        
        scroll(to: delegate.initialViewController, animated: false)
    }

    func scroll(to controller: UIViewController, animated: Bool) {
        guard let index =  indexFor(controller: controller) else { return }
        let contentOffset = CGPoint(x: CGFloat(index) * pageSize.width, y: 0)
        scrollView.setContentOffset(contentOffset, animated: animated)
    }
    
    func isVisible(controller: UIViewController) -> Bool {
        guard let index = indexFor(controller: controller) else { return false}
        let _frame = frame(for: index)
        return _frame.intersects(scrollView.bounds)
    }
}

// MARK: - Private methods
fileprivate extension ScrollViewController {
  
  func frame(for index: Int) -> CGRect {
    return CGRect(x: CGFloat(index) * pageSize.width,
                  y: 0,
                  width: pageSize.width,
                  height: pageSize.height)
  }
  
  func indexFor(controller: UIViewController) -> Int? {
    return viewControllers.index(where: {$0 == controller } )
  }
  
}

// MARK: - Scroll View Delegate
extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate.scrollViewDidScroll()
    }
}
