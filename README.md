# KSURLValueTransformer

[![Build Status](https://travis-ci.org/keith/KSURLValueTransformer.svg)](https://travis-ci.org/keith/KSURLValueTransformer)

A `NSValueTransformer` subclass for storing `NSURL`s in Core Data.

## Usage

To use this value transformer follow these steps:

1. Create your attribute on your entity in your `.xcdatamodeld`
1. Choose `Transformable` for the Type
1. Under the Attribute Type field in the Utilities pane fill in Name
   with `KSURLValueTransformer`

## Installation

Install via [Carthage](https://github.com/Carthage/Carthage) or
[CocoaPods](http://cocoapods.org).
