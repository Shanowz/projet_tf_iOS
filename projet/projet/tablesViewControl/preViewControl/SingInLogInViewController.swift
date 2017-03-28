
import UIKit

class SingInLogInViewController: UIViewController {
    @IBOutlet weak var bannerImageView: BannerImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImageView.image = BannerImageView.shared.bannerImage
        bannerImageView.frame = BannerImageView.shared.myFrame!
        print("ici \(BannerImageView.shared.test)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
