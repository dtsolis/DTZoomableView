DTZoomableView
==============

A reusable control to replace `UIImageView` and enable images to zoom in/out. Used in [AGPhotoBrowser](https://github.com/andreagiavatto/AGPhotoBrowser) photo browser and now it's written in Swift.


## Install
- copy the content of the 'DTZoomableView' folder in your project
- import `DTZoomableView.swift` in your class

## Usage
Example usage:
<pre>
let zoomableView: DTZoomableView = DTZoomableView(frame: CGRectMake(10, 100, 300, 300))
zoomableView.image = UIImage(named: "sample_image")
self.view.addSubview(zoomableView)
</pre>

You can enabled/disable zoom capability by calling the corresponding function...
<pre>
zoomableView.setZoomEnabled(false)
</pre>

...or check if zoom is enabled.
<pre>
if zoomableView.isZoomEnabled() {
	...
}
</pre>
