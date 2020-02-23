import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.backgroundColor = UIColor.red
let box = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
box.backgroundColor = UIColor.yellow
view.addSubview(box)

extension UIView {
    static func animate(timeDuration duration: TimeInterval, animations:  @escaping ()->Void, group: DispatchGroup, completion: ((Bool)->())? ) {
        group.enter()
        self.animate(withDuration: duration, animations: animations) { response in
            completion?(response)
            group.leave()
            print("Group Resume")
        }
    }
}

let animationGroup = DispatchGroup()

UIView.animate(timeDuration: 2, animations: {
  box.center = CGPoint(x: 150, y: 150)
  }, group: animationGroup ,completion: {
    _ in
    UIView.animate(timeDuration: 2, animations: {
        box.transform = CGAffineTransform(rotationAngle: .pi/4)
    }, group: animationGroup, completion: .none)
})

UIView.animate(timeDuration: 4, animations: { () -> Void in
  view.backgroundColor = UIColor.blue
}, group: animationGroup, completion: nil)

animationGroup.notify(queue: DispatchQueue.main) {
    print("Group finished")
}

PlaygroundPage.current.liveView = view
