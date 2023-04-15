//
//  Fire.swift
//  JiraClone
//
//  Created by user1 on 14/04/23.
//

//import Firebase

//class Fire {
//    
//    static var shared: Fire = Fire()
//    
//    private var db = Firestore.firestore()
//    
//    
//    func getPlans(newPlans: @escaping ([Plan]) -> Void) {
//        indicator(show: true)
//        self.db.collection("plan").addSnapshotListener { [self] snapshot, err in
//            
//            if let err = err {
//                Alert.showAlert(forState: .error, message: "Error getting data", duration: 2, userInteration: true)
//                indicator(show: false)
//                print(err)
//            } else {
//                indicator(show: false)
//                var plans: [Plan] = []
//                
//                for doc in snapshot!.documents {
//                    let doc1 = doc.data() as! [String : AnyObject]
//                    
//                    let a = Plan(
//                        name: doc1["name"] as! String,
//                        todo: doc1["todo"] as! [String],
//                        progres: doc1["progres"] as! [String],
//                        qa: doc1["qa"] as! [String],
//                        done: doc1["done"] as! [String]
//                    )
//                    plans.append(a)
//                }
//                newPlans(plans)
//            }
//        }
//    }
//    
//    
//    
//    private func indicator(show: Bool) {
//        let indicator = UIActivityIndicatorView(style: .large)
//        indicator.tag = 9998
//        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
//            if show {
//                window.addSubview(indicator)
//                indicator.center = window.center
//                indicator.startAnimating()
//            } else {
//                if let indi = window.viewWithTag(9998) {
//                    indi.removeFromSuperview()
//                }
//            }
//        }
//    }
//}
