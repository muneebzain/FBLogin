//
//  ViewController.swift
//  FBLogin
//
//  Created by Muneeb Zain on 08/03/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FacebookCore
import FBSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let loginManager = LoginManager()
    
    
    @IBAction func fbLoginBtnPressed(_ sender: UIButton) {
        facebookLogin()
    }
    
    
    //MARK: - FacebookLogin
    func facebookLogin() {
        
        loginManager.logIn(permissions: ["email"], from: self) { [self] result, error in
            if let error = error {
                debugPrint("Could not login Facebook", error)
            } else if result!.isCancelled {
                print("facebook login was cancelled")
            } else {
                
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                Auth.auth().signIn(with: credential) { result, error in
                        if let error = error {
                            print(error)
                            return
                        }else {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
               
                
            }
        }
    }
}

