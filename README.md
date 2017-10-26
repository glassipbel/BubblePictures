![Bubble Pictures](https://raw.githubusercontent.com/kbelter/BubblePictures/master/Screenshots/logo2.png)

![Bubble Pictures](https://raw.githubusercontent.com/kbelter/BubblePictures/master/Screenshots/m4.png)

![Bubble Pictures](https://raw.githubusercontent.com/kbelter/BubblePictures/master/Screenshots/m3.png)

(Pictures from [Luv.it](http://luv.it) App using Bubble Pictures)

*Creator And Main (Unique) Dev Kevin Belter. [Kev](https://www.linkedin.com/in/kevinbelter)

[![Version](https://img.shields.io/cocoapods/v/BubblePictures.svg?style=flat)](http://cocoapods.org/pods/BubblePictures)
[![License](https://img.shields.io/cocoapods/l/BubblePictures.svg?style=flat)](http://cocoapods.org/pods/BubblePictures)
[![Platform](https://img.shields.io/cocoapods/p/BubblePictures.svg?style=flat)](http://cocoapods.org/pods/BubblePictures)

## About

This library is for showing pictures in a nice way, maybe you want to show users that upvoted a post or something like that, in that case BubblePictures is the way to go.
BubblePictures supports all Screen sizes and orientations.
And it's super easy to use.
Feel free to download the example and play with different sizes :P
If you have questions about it, please contact me at my email.
Made with love and caffeine :).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 9.0 or above

## Installation

BubblePictures is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BubblePictures"
```

## Usage

To use it just add a CollectionView with your desired size, after that create an IBOUTLET to have a reference for that CollectionView.

Then you must create an BPCellConfigFile for each bubble picture that you want to show.
The BPCellConfigFile initializer has 2 values:
- imageType: (This is an Enum that support 3 different values, [UIImage, URL or UIColor])
- title: This is an String for the title in front of the bubble picture.

After having your array of BPCellConfigFile you must have as well a reference to the bubblePicture instance so you can have it like this in your ViewController for example: 

private var bubblePictures: BubblePictures!

Finally in your ViewDidLoad you can initialize the bubblePictures like this:

bubblePictures = BubblePictures(collectionView: {{YOUR_COLLECTION_VIEW}}, configFiles: {{YOUR_BPCellConfigFiles_ARRAY}})

That's it, now you should see the bubbles rendering perfectly.

## Delegate

If you want to know when an user tap on a bubble you must adopt the protocol BPDelegate.
It has 2 methods for that pourpose:
- func didSelectTruncatedBubble()
- func didSelectBubble(at index: Int)

With those methods you can achieve what ever you need when the user taps the bubbles.

Dont forget to mark in your bubblePictures instance that you are now the delegate by doing this:

bubblePictures.delegate = self

## Layout Configuration

If you want to config the layout, you must inject in the initializer the layoutConfigurator.

The layoutConfigurator is an struct that has these values for the now:
- backgroundColorForTruncatedBubble: This color is for the background color in case that the bubbles are being truncated because of the space in the screen.
- fontForBubbleTitles: If you want to use another font you can pass it here for the bubble titles.
- colorForBubbleBorders: If you have for example a black background below the collectionView you should pass UIColor.black for achieving a good layout.
- colorForBubbleTitles: This is the color of the bubble titles.
- maxCharactersForBubbleTitles: This is the max lenght of characters for every bubble title.

NEW ONES:
- maxNumberOfBubbles: You can add this property if you want to hardcode the number of bubbles that will be shown. (If the number is larger than the whole screen, then it will show the maximum number of bubbles that fits the screen)
- numberForTruncatedCell: If you don't want BubblePictures to calculate the number in the truncated cell, then you can assign one yourself.
- widthForBubbleBorders: The border width for the bubbles.
- bubbleImageContentMode: The content mode for the image in the bubbles.
- distanceInterBubbles: The distance between each bubble, the default value is the size of the bubble divided by 3.
- alignment: The alignment of the bubbles, if you want them right or left.

So you can create a layoutConfigurator like this:

let layoutConfigurator = BPLayoutConfigurator(
backgroundColorForTruncatedBubble: UIColor.hex("D75A4A"),
fontForBubbleTitles: UIFont(name: "HelveticaNeue-Light", size: 17.0)!,
colorForBubbleBorders: UIColor.white,
colorForBubbleTitles: UIColor.white,
maxCharactersForBubbleTitles: 3)

and then inject it in the initializer:

bubblePictures = BubblePictures(collectionView: {{YOUR_COLLECTION_VIEW}}, configFiles: {{YOUR_BPCellConfigFiles_ARRAY}}, layoutConfigurator: layoutConfigurator)

## Author

Kevin Belter, kevin.belter@outlook.com

*Artist Carlos Nicolas [Kans](http://dribbble.com/kans1001)

## License

BubblePictures is available under the MIT license. See the LICENSE file for more info.

