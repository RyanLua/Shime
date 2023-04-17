<h1 align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/80087248/229268959-a3cb2881-3022-4acf-afc5-b6007e94ff3d.png">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/80087248/229328903-68ae2d94-aa31-4651-bce3-45ae6159897c.png">
    <img src="https://user-images.githubusercontent.com/80087248/229268585-bc4ab425-809c-4a1e-a4c1-a693e861f455.png">
  </picture>
  
  [![CI](https://github.com/RyanLua/Shime/actions/workflows/stylua.yml/badge.svg)](https://github.com/RyanLua/Shime/actions/workflows/stylua.yml)
  [![GitHub release](https://img.shields.io/github/v/release/RyanLua/Shime?logo=github)](https://github.com/RyanLua/Shime/releases)
  [![GitHub top language](https://img.shields.io/github/languages/top/RyanLua/Shime?logo=lua)](https://github.com/search?q=repo%3ARyanLua%2FShime++language%3ALua&type=code)
  [![GitHub license](https://img.shields.io/github/license/RyanLua/Shime?logo=apache)](LICENSE.txt)
</h1>

<div align="center">
Shimmer is a class required from the Shime module that allows you to easily create a shimmer effect on any GuiObject just like how Roblox does.
</div>

## About

> **Note**
>
> Visit the [Shime Wiki](https://github.com/RyanLua/Shime/wiki) for more information about Shime, including installation, usage, and documentation.

Shime is a module that allows you to easily create a shimmer effect on any [`GuiObject`](https://create.roblox.com/docs/reference/engine/classes/GuiObject). Shime is easy to use and extremely customizable. Shime achieves this by using a [`UIGradient`](https://create.roblox.com/docs/reference/engine/classes/UIGradient) that is animated using a [`Tween`](https://create.roblox.com/docs/reference/engine/classes/Tween). Shime will detect the GuiObject's size and position to apply the proper gradient to it and will clip to the guiobject's size including [`UICorners`](https://create.roblox.com/docs/reference/engine/classes/UICorner).

<img src="https://user-images.githubusercontent.com/80087248/229268404-127c8838-46b3-42cd-af84-a6e06a1e136e.gif" width="300"/>

## Demo

> **Note**
>
> [Shimmer Demo](https://www.roblox.com/games/12865649978) has Content Sharing enabled. You can download the demo from the Roblox website by clicking the ellipsis (`...`)and selecting `Download`.

We provide an open-source demo of Shime, you can [view the demo](https://www.roblox.com/games/12865649978) on Roblox. Feel free to use the demo as a reference for how to use Shime and modify it to your liking.

<a href="https://www.roblox.com/games/12865649978"><img src="https://user-images.githubusercontent.com/80087248/229328112-31295fd2-c501-4415-9ef6-8d3b1047ec82.png" width="600"/></a>

## Features

Shime has a lot of features that allow you to customize the shimmer effect to your liking. Here are some of the features:

### Tween Animations

Shime uses a TweenService to animate the gradient. This allows you to customize the animation to your liking. You can change the time, style, direction, repeat count, and delay time. You can change the TweenInfo of the animation by using the [`Shime.new`](https://github.com/RyanLua/Shime/wiki/Documentation#constructors-1) constructor and passing in the parameters you want to change.

### Easy & Versatile

Shime is extremely versatile, working on nearly all GuiObjects and allows easy customization through its class. You can use Shime on any GuiObject including TextButtons, TextLabels, ImageLabels, Frames, and more. Shime will automatically detect the GuiObject's size and position to apply the proper gradient to it and will clip to the guiobject's size including any UICorner instances.

### Informative Wiki

Shime has its own GitHub Wiki with an included [Getting Started](https://github.com/RyanLua/Shime/wiki/Getting-Started) page that will help you get started with Shime which includes multiple installation methods, usage guides, and real-world code samples. The wiki also includes a [Documentation](https://github.com/RyanLua/Shime/wiki/Documentation) page with all the methods, properties, and constructors for Shime.

## Installation

> **Note**
>
> Visit the [**Installation**](https://github.com/RyanLua/Shime/wiki/Getting-Started#installation) page more information on installation. Below is a quick summary of the installation methods.

Shime is easy to install. They are many ways to install Shime. The links below will take you to the installation method you want to use.

| Install Method | Asset Link |
| :--- | :--- |
| [Install from Roblox](Getting-Started#install-from-roblox) | [Shimmer - Creator Marketplace](https://create.roblox.com/marketplace/asset/12959615382) |
| [Install from GitHub](Getting-Started#install-from-github) | [Shime - GitHub](https://github.com/RyanLua/Shime/releases)

## Usage

> **Note**
>
> Visit the [**Usage**](https://github.com/RyanLua/Shime/wiki/Getting-Started#usage) page more information on usage, including additional code samples.

Shime is easy to use. The API is simple and easy to understand. Below is a simple code sample of how to create a shimmer effect on a GuiObject using Shime.

```lua
-- Require the Shime module
local Shime = require(game.ReplicatedStorage.Shime)

-- Create a new Shimmer and play it
local shimmer = Shime.new(script.Parent)
shimmer:Play()
```

## Documentation

> **Note**
>
> Visit the [**Documentation**](https://github.com/RyanLua/Shime/wiki/Documentation) page more information on the Shime module and more details about Shime Constructors, Methods, and Properties.

Shime has many methods and properties that allow you to customize the shimmer effect to your liking. Below is a summary of all the methods, properties, and constructors for Shime.

### [Constructors](https://github.com/RyanLua/Shime/wiki/Documentation#constructors-1)

| new(parent: [`GuiObject`](https://create.roblox.com/docs/reference/engine/classes/GuiObject)) |
| :--- |
| Returns a [`table`](https://create.roblox.com/docs/reference/engine/libraries/table) containing `Shimmer`'s metatable. Shimmers using default parameters. |

| new(parent: [`GuiObject`](https://create.roblox.com/docs/reference/engine/classes/GuiObject), time: [`number`](https://create.roblox.com/docs/scripting/luau/numbers)?, style: [`EasingStyle`](https://create.roblox.com/docs/reference/engine/enums/EasingStyle)?, direction: [`EasingDirection`](https://create.roblox.com/docs/reference/engine/enums/EasingDirection)?, repeatCount: [`number`](https://create.roblox.com/docs/scripting/luau/numbers)?, reverses: [`boolean`](https://create.roblox.com/docs/scripting/luau/booleans)?, delayTime: [`number`](https://create.roblox.com/docs/scripting/luau/numbers)?) |
| :--- |
| Returns a [`table`](https://create.roblox.com/docs/reference/engine/libraries/table) containing `Shimmer`'s metatable. Shimmers using specified parameters. |

### [Properties](https://github.com/RyanLua/Shime/wiki/Documentation#properties-1)

| Property | Details |
| :--- | :--- |
| PlaybackState: [`Enum.PlaybackState`](https://create.roblox.com/docs/reference/engine/enums/PlaybackState) | This read-only property will return [`Enum.PlaybackState`](https://create.roblox.com/docs/reference/engine/enums/PlaybackState). |

### [Methods](https://github.com/RyanLua/Shime/wiki/Documentation#methods-1)

| GetFrame(): [`Frame`](https://create.roblox.com/docs/reference/engine/classes/Frame) |
| :--- |
| The GetFrame function returns the [`Frame`](https://create.roblox.com/docs/reference/engine/classes/Frame) that is used to create the shimmer effect. This frame can be customized after the shimmer is created.|

| GetGradient(): [`UIGradient`](https://create.roblox.com/docs/reference/engine/classes/UIGradient) |
| :--- |
| The GetGradient function returns the [`UIGradient`](https://create.roblox.com/docs/reference/engine/classes/UIGradient) that is used to create the shimmer effect. This gradient can be customized after the shimmer is created. |

| Stop(): `void` |
| :--- |
| The Stop function halts `Shimmer`. If [`Shimmer:Play()`](https://github.com/RyanLua/Shime/wiki/Documentation#play) is called again the `Shimmer` will resume interpolating towards their destination but take the full length of the time to do so. |

| Pause(): `void` |
| :--- |
| The Pause function halts `Shimmer`. If you call [`Shimmer:Play()`](https://github.com/RyanLua/Shime/wiki/Documentation#play) again, the shimmer resumes playback from the moment it was paused. |

| Play(): `void` |
| :--- |
The Play function starts `Shimmer`. Note that if a shimmer has already begun calling Play will have no effect unless the shimmer has finished or has been stopped (either by [`Shimmer:Stop()`](https://github.com/RyanLua/Shime/wiki/Documentation#stop) or [`Shimmer:Pause()`](https://github.com/RyanLua/Shime/wiki/Documentation#pause). |

## Contributing

We worked hard to make this **open-source plugin**, so please **contribute at your will**. Go ahead and [fork this repository](https://github.com/RyanLua/Shime/fork), and maybe we will merge to ours someday.

If you **have a change** you want to make, please [open a new pull request](https://github.com/RyanLua/Shime/compare).

If you see a **bug or want a feature**, please [open an issue](https://github.com/RyanLua/Shime/issues/new/choose).

## License

Shime is **licensed under** [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0). See [LICENSE.txt](LICENSE.txt) for details.
