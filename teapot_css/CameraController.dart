class CameraController {

  Function onchange = null;
  num xRot = 0;
  num yRot = 0;
  num scaleFactor = 3.0;
  bool dragging = false;
  num curX = 0;
  num curY = 0;
  Element element;
  
  CameraController(this.element) {
    element.on.mouseDown.add(_onmousedown);
    element.on.mouseUp.add(_onmouseup);
    element.on.mouseMove.add(_onmousemove);
  }
  
  _onmousedown(MouseEvent event) {
    curX = event.clientX;
    curY = event.clientY;
    dragging = true;
    
  }
  
  _onmouseup(MouseEvent event) {
    dragging = false;

  }
  
  _onmousemove(MouseEvent event) {
    if (dragging) {
      // Determine how far we have moved since the last mouse move
      // event.
      var _curX = event.clientX;
      var _curY = event.clientY;
      var deltaX = (curX - _curX) / scaleFactor;
      var deltaY = (curY - _curY) / scaleFactor;
      curX = _curX;
      curY = _curY;
      // Update the X and Y rotation angles based on the mouse motion.
      yRot = (yRot + deltaX) % 360;
      xRot = (xRot + deltaY);
      // Clamp the X rotation to prevent the camera from going upside
      // down.
      if (xRot < -90) {
          xRot = -90;
      } else if (xRot > 90) {
          xRot = 90;
      }
      // Send the onchange event to any listener.
      if (onchange != null) {
          onchange();
      }
  }
  }
}
