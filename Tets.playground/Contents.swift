import UIKit

struct Color {
  var hue: CGFloat?
  var saturation: CGFloat?
  var luminance: CGFloat?
}

//  7B68EE
//"tetradic": ["EEB882", "82EE82", "82B8EE"]
func getTetraticColorsUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) {
  var hueOne = CGFloat()
  var hueTwo = CGFloat()
  var hueThree = CGFloat()
  if (hue + 90) <= 360 {
    hueOne = (hue + 90)
  } else {
    hueOne = ((hue + 90) - 360)
  }
  
  if (hue + 180) <= 360 {
    hueTwo = (hue + 180)
  } else {
    hueTwo = ((hue + 180) - 360)
  }
  
  if hue + 270 <= 360 {
    hueThree = (hue + 270)
  } else {
    hueThree = ((hue + 270) - 360)
  }
  
  let tetOne = Color(hue: hueOne, saturation: saturation, luminance: luminance)
  let tetTwo = Color(hue: hueTwo, saturation: saturation, luminance: luminance)
  let tetThree = Color(hue: hueThree, saturation: saturation, luminance: luminance)
  let tetradic = [tetOne, tetTwo, tetThree]
  
  for item in tetradic {
    print(item.hue)
  }
}
getTetraticColorsUsing(hue: 300, saturation: 0.76, luminance: 0.72)
//hsl(300, 76%, 72%)

//hsl(30, 76%, 72%)
//hsl(120, 76%, 72%)
//hsl(210, 76%, 72%)
