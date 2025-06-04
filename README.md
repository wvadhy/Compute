<p align="center">
  <img src="https://github.com/user-attachments/assets/084e9d89-134e-4573-b7f4-1074c4b8dfcd"/>
</p>

<h1 align="center">
   Compute
</h1>

<h4 align="center">
   Runner-up project at the Oxford Brookes 2025 Tech Show
</h4>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/wvadhy/Compute/blob/main/LICENSE">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
  </a>
  <img src="https://img.shields.io/website-up-down-green-red/http/computex.cloud">
</p>

### Investigating how gamification and LLMs can increase e-learning gratification with the use of a contemporary mobile application

There are presently over three-hundred thousand apps categorised as educational on the app store today, many of these apps seeing huge growth across the covid pandemic 
as both younger and older demographics were thrust into the new world of online pedagogy due to school closures. Educational apps commonly aim for an optimised, 
resource efficient path of academic tuition, one which is commonly obtained by combining attributes of traditional classroom based learning and overt gamification. 

This consists of using simplistic interfaces offered by mobile devices to appropriately present lessons in an easily consumable manner, providing users with instant 
gratification upon completion of a task to constitute a rewarding engagement cycle. One of the promising technologies to support such efforts is AI. Educational apps are 
heavily reliant on the utilisation of large language models ( LLM ), to generate personalised experiences based upon contextual references and for the generation of tasks in a more efficient manner. 

However, proper integration and efficient utilisation of LLMs and classroom based learning techniques is not an easy task, many programming based educational apps falling short in this regard. 

This paper discusses my artifact, Compute, and how it can improve e-learning gratification with the use of contemporary LLM and gamification mechanics. Compute is an educational app that provides 
a less aggressive and more gamified approach to pedagogy, applying more dynamic mechanics present in gamification such as direct interactivity between users. Compute builds upon the robust 
foundation laid out by its peers, but uses Google’s firstore and continuous iterative learning to further expand on the integration of LLMs for more flexible inclusion into multiple facets of academic instruction. 

This enhances modularity and allows for more productive learning arcs.

### How to use

Compute has been designed to work on all versions of the iPhone 10 - iPhone 15 ( excluding the SE ). It will ideally be able to function on any iPhone model released after the iPhone 10 as long as they are running iOS 15.0+ and haven’t introduced any new screen elements. 

Any Apple Silicon based macbook will also be able to run Compute natively with minimal issues due to the inherit mobile foundations of the silicon processor.

In terms of performance across iOS devices, Compute was designed in a very resource minimalist way, the app itself is very lightweight and delegates much of the computation to the LLM at the endpoint of a REST api. This means that performance is very fast, even on older iPhone models and versions.

For users wishing to use the LTS build of Compute, they can do so by downloading the app directly off the app store, this will automate the process of notarisation and gatekeeper authentication.

For users looking to use the development build of Compute there are some prerequisites. Firstly, users will require a device running macOS to use Xcode, although alternative methods such as running a VM  do exist, the complexity and error prone nature of these methods means I cannot recommend them.

Once the source files have been added to their local machine they can simply open the `Compute.xcworkspace` file which will automatically launch the project in Xcode. From there users can simply navigate to the bundle_identifier tab in the project settings and change the development team to their own in the format: `com.user.compute`.

The app can now be run directly from the user’s machine, a simulator will be used by default. Alternatively, usage of a physical iOS device can be done with ease. By simply enabling developer mode on the iOS device’s settings, plugging in the device to their machine using a usb-c cable and selecting their iPhone as the build_target, Compute will be installed and run on their iPhone.

### Tech show award winning poster
![Compute Poster (1)](https://github.com/user-attachments/assets/ffe0f9da-0cfc-4a4e-9095-f519958ab939)





