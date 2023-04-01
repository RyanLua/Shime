<h1 align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/80087248/229268959-a3cb2881-3022-4acf-afc5-b6007e94ff3d.png">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/80087248/229268958-1d45c5fe-9759-4f21-af33-9b21b1e4e68e.png">
    <img src="https://user-images.githubusercontent.com/80087248/229268585-bc4ab425-809c-4a1e-a4c1-a693e861f455.png">
  </picture>
</h1>

<div align="center">
Shimmer is a class required from the Shime module that allows you to easily create a shimmer effect on any GuiObject just like how Roblox does.
</div>

## About

Shime is a module that allows you to easily create a shimmer effect on any GuiObject. Shime is easy to use and extremely customizable. Shime achieves this by using a gradient that is animated to create the shimmer effect which is then applied to the GuiObject. It will automatically detect the GuiObject's size and position to apply the proper gradient to it and will clip to the guiobject's size including UI Corners.

<img src="https://user-images.githubusercontent.com/80087248/229268404-127c8838-46b3-42cd-af84-a6e06a1e136e.gif" width="250" />

## Features

Shime has a lot of features that allow you to customize the shimmer effect to your liking. Here are some of the features:

- Customizable Tween Animations
- Open-source & Versatile
- Clipping for UI Corners
- Simple API with Documentation

## Installation

Shime is easy to install. They are many ways to install Shime. You can learn more on how to install Shime by opening [Getting Started](Getting-Started) or by clicking the links below which will take you to the [wiki page](Home) for the installation method you want to use.

> **Warning**
>
> **Install from Roblox** and **Install from GitHub** will not allow for automatic updates including security updates. It is recommended to use the Require from Roblox method. Only use this method if you are planning to use a modified version of Shime.

- [Require from Roblox](Getting-Started#require-from-roblox)
- [Install from Roblox](Getting-Started#install-from-roblox)
- [Install from GitHub](Getting-Started#install-from-github)

## Usage

Shime is easy to use. The API is simple and easy to understand. Please see [**Usage**](Usage) for more information as well as code samples of how to use Shime. Below is a simple example of how to create a shimmer effect on a GuiObject using Shime.

```lua
-- Require the Shime module
local Shime = require(12958292783)

-- Create a new Shimmer and play it
local shimmer = Shime.new(script.Parent)
shimmer:Play()
```

## Documentation

Shime has many methods and properties that allow you to customize the shimmer effect to your liking. Please see [**Documentation**](Documentation) for more information on the API. Below is a list of all the methods, properties, and constructors for Shime.

### [Constructors](Documentation#constructors)

| new(parent: [`GuiObject`](https://create.roblox.com/docs/reference/engine/classes/GuiObject)) |
| :--- |
| Returns a [`table`](https://create.roblox.com/docs/reference/engine/libraries/table) containing `Shimmer`'s metatable. Shimmers using default parameters. |

| new(parent: [`GuiObject`](https://create.roblox.com/docs/reference/engine/classes/GuiObject), time: [`number`](https://create.roblox.com/docs/scripting/luau/numbers)?, style: [`EasingStyle`](https://create.roblox.com/docs/reference/engine/enums/EasingStyle)?, direction: [`EasingDirection`](https://create.roblox.com/docs/reference/engine/enums/EasingDirection)?, repeatCount: [`number`](https://create.roblox.com/docs/scripting/luau/numbers)?, reverses: [`boolean`](https://create.roblox.com/docs/scripting/luau/booleans)?, delayTime: [`number`](https://create.roblox.com/docs/scripting/luau/numbers)?) |
| :--- |
| Returns a [`table`](https://create.roblox.com/docs/reference/engine/libraries/table) containing `Shimmer`'s metatable. Shimmers using specified parameters. |

### [Properties](Documentation#properties)

| Property | Details |
| --- | --- |
| IsCompleted: [`boolean`](https://create.roblox.com/docs/scripting/luau/booleans) | This read-only property will return true when the `Shimmer` has completed. |
| IsPaused: [`boolean`](https://create.roblox.com/docs/scripting/luau/booleans) | This read-only property will return true when the `Shimmer` is not playing. |
| IsPlaying: [`boolean`](https://create.roblox.com/docs/scripting/luau/booleans) | This read-only property will return true when the `Shimmer` is playing. |

### [Methods](Documentation#methods)

| Stop(): `void` |
| :--- |
| The Stop function halts `Shimmer`. If [`Shimmer:Play()`](#play) is called again the `Shimmer` will resume interpolating towards their destination but take the full length of the time to do so. |

| Pause(): `void` |
| :--- |
| The Pause function halts `Shimmer`. If you call [`Shimmer:Play()`](#play) again, the shimmer resumes playback from the moment it was paused. |

| Play(): `void` |
| :--- |
The Play function starts `Shimmer`. Note that if a shimmer has already begun calling Play will have no effect unless the shimmer has finished or has been stopped (either by [`Shimmer:Stop()`](#stop) or [`Shimmer:Pause()`](#pause)). |

## Contributing

We worked hard to make this **open-source plugin**, so please **contribute at your will**. Go ahead and [fork this repository](https://github.com/RyanLua/Shime/fork), and maybe we will merge to ours someday.

If you **have a change** you want to make, please [open a new pull request](https://github.com/RyanLua/Shime/compare).

If you see a **bug or want a feature**, please [open an issue](https://github.com/RyanLua/Shime/issues/new/choose).

## License

Signs is **licensed under** the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0). See [LICENSE.txt](LICENSE.txt) for details.

