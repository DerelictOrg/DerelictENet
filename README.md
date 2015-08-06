DerelictENET
============

A dynamic binding to [ENet](http://enet.bespin.org/) for the D Programming Language.

Please see the pages [Building and Linking Derelict](http://derelictorg.github.io/compiling.html) and [Using Derelict](http://derelictorg.github.io/using.html), or information on how to build DerelictENet and load the ENet library at run time. In the meantime, here's some sample code.

```D
import derelict.enet.enet;

void main() {
    // Load the ENet library.
    DerelictENet.load();

    // Now ENet functions can be called.
    ...
}
```
