# DemoProperty
## 问题

NSString 什么时候用copy， 什么时候用retain，区别是什么？

## 解答

#### NSMutableString

对源头是NSMutableString的字符串，retain仅仅是指针引用，增加了引用计数器，这样源头改变的时候，用这种retain方式声明的变量（无论被赋值的变量是可变的还是不可变的），它也会跟着改变; 而copy声明的变量，它不会跟着源头改变，它实际上是深拷贝。

```

NSMutableString *mStr = [NSMutableString stringWithFormat:@"abc"];

self.rString = mStr;

self.cString = mStr;

NSLog(@"mStr     : %p, %p", mStr,&mStr);

NSLog(@"retainStr: %p, %p", _rString, &_rString);

NSLog(@"copyStr  : %p, %p", _cString, &_cString);

[mStr appendString:@"de"];

NSLog(@"retainStr: %@", _rString);

NSLog(@"copyStr  : %@", _cString);

```

#####输出：

    mStr     : 0x1003001c0, 0x7fff5fbff6b8

    retainStr: 0x1003001c0, 0x100300108

    copyStr  : 0x63626135, 0x100300110

    retainStr: abcde

    copyStr  : abc

***

    mStr → 0x1003001c0

    retainStr ⤴︎

    copyStr → 0x63626135

####NSString

对源头是NSString的字符串，无论是retain声明的变量还是copy声明的变量，当第二次源头的字符串重新指向其它的地方的时候，它还是指向原来的最初的那个位置，也就是说其实二者都是指针引用，也就是浅拷贝。

```

NSString *str = [NSString stringWithFormat:@"abc"];

self.rString = str;

self.cString = str;

NSLog(@"str      : %p, %p", str,&str);

NSLog(@"retainStr: %p, %p", _rString, &_rString);

NSLog(@"copyStr  : %p, %p", _cString, &_cString);

```

#####输出：

    str      : 0x63626135, 0x7fff5fbff6b0

    retainStr: 0x63626135, 0x100300108

    copyStr  : 0x63626135, 0x100300110    

***

    str → 0x63626135

    retainStr ⤴︎ 

    copyStr ⤴︎

另外说明一下，这两者对内存计数的影响都是一样的，都会增加内存引用计数，都需要在最后的时候做处理。

其实说白了，对字符串为啥要用这两种方式？我觉得还是一个安全问题，比如声明的一个NSString \*str变量,然后把一个NSMutableString \*mStr变量的赋值给它了，

如果要求str跟着mStr变化，那么就用retain;

如果str不能跟着mStr一起变化，那就用copy。

而对于要把NSString类型的字符串赋值给str，那两都没啥区别。不会影响安全性，内存管理也一样。

[github](https://github.com/liuxj/DemoProperty "Title")
﻿