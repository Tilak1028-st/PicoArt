//
//  MainIntroViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 12/12/23.
//

import UIKit

class NewMainIntroViewController:  UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
    
    var pages = [UIViewController]()
    var pageControl = UIPageControl()
    var isForStepByStep: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let page1VC = storyboard.instantiateViewController(withIdentifier: "FirstIntroViewController") as? FirstIntroViewController,
           let page2VC = storyboard.instantiateViewController(withIdentifier: "SecondIntroViewController") as? SecondIntroViewController,
           let page3VC = storyboard.instantiateViewController(withIdentifier: "ThirdIntroViewController") as? ThirdIntroViewController,
           let page4VC = storyboard.instantiateViewController(withIdentifier: "FourthIntroViewController") as? FourthIntroViewController,
            let page5VC = storyboard.instantiateViewController(withIdentifier: "FifthIntroViewController") as? FifthIntroViewController {
            pages.append(contentsOf: [page1VC, page2VC, page3VC, page4VC, page5VC])
            dataSource = self
            delegate = self
            
            setViewControllers([page1VC], direction: .forward, animated: true, completion: nil)
            configurePageControl()
        } else {
            print("One or more Intro View Controllers could not be instantiated.")
        }
    }
    
    
    func configurePageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = pages.firstIndex(of: currentViewController) {
                pageControl.currentPage = index
            }
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard pages.count != nextIndex else { return nil }
        guard pages.count > nextIndex else { return nil }
        return pages[nextIndex]
    }
}
