# jimaku

Automagically rename your subtitle files.

## Download

To download it for normal usage please refer to the [releases page](https://github.com/danitrap/jimaku/releases).

## Usage

Drag and drop your video and subtitle files on jimaku.exe to automagically rename your subtitle file.

## Development

### Build

I use [OCRA](https://github.com/larsch/ocra) to build it, make sure to install it: `gem install ocra`

    ocra start.rb --windows --output ./build/jimaku.exe

## Test

To test this app just run rspec `rspec spec/`

## License

The MIT License

Copyright (c) 2013 Daniele Trapani

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.