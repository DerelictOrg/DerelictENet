DerelictENET
============

*Warning: this an unofficial Derelict binding.*

A dynamic binding to [ENet](http://enet.bespin.org/) for the D Programming Language.

For information on how to build DerelictENet and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

For information on how to load the ENet library via DerelictENet, see the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki. In the meantime, here's some sample code.

```D
import derelict.enet.enet;

void main() {
    // Load the ENet library.
    DerelictENet.load();
    
    // Now ENet functions can be called.
    ...
}
```
