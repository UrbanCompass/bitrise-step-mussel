# Mussel

As of Xcode 12.4, users are able to test Push Notifications via the simulator. Unfortunately, Apple has yet to introduce the ability to leverage this new method within the XCUITest Framework. 

Testing Universal Links can also be an adventure, potentially accumulating lots of extra unwanted time in UI Tests, especially if your team wants to speed up your app's regression progress. Conventional methods resorted to using iMessage or Contacts to open Universal Links which routed to a specific feature within an application. 

Mussel introduces a quick and simple way to test Push Notifications and Universal Links which route to any specific features within your iOS app.

Checkout the `Mussel` framework for use within your iOS projects: https://github.com/UrbanCompass/Mussel

##  How It Works:

1. An Engineer triggers XCUITests in XCode manually or through your Continuous Integration platform of choice.
2. Mussel Server boots up along with the iOS Simulator.
3. A Test Case triggers a Push Notification or Universal Link Test Case
4. The Test Case sends a payload containing Push Notification or Universal Link data via POST Request.
5. Server runs respective xcrun simctl command for Push Notifications or Universal Links.
6. The command presents a Push Notification or launches a Universal Link within the iOS Simulator.

## How to use this Step

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise),
just `git clone` this repository, `cd` into it's folder in your Terminal/Command Line
and call `bitrise run test`.

*Check the `bitrise.yml` file for required inputs which have to be
added to your `.bitrise.secrets.yml` file!*

Step by step:

1. Open up your Terminal / Command Line
2. `git clone` the repository
3. `cd` into the directory of the step (the one you just `git clone`d)
5. Create a `.bitrise.secrets.yml` file in the same directory of `bitrise.yml`
   (the `.bitrise.secrets.yml` is a git ignored file, you can store your secrets in it)
6. Check the `bitrise.yml` file for any secret you should set in `.bitrise.secrets.yml`
  * Best practice is to mark these options with something like `# define these in your .bitrise.secrets.yml`, in the `app:envs` section.
7. Once you have all the required secret parameters in your `.bitrise.secrets.yml` you can just run this step with the [bitrise CLI](https://github.com/bitrise-io/bitrise): `bitrise run test`

An example `.bitrise.secrets.yml` file:

```
envs:
- A_SECRET_PARAM_ONE: the value for secret one
- A_SECRET_PARAM_TWO: the value for secret two
```

## How to contribute to this Step

1. Fork this repository
2. `git clone` it
3. Create a branch you'll work on
4. To use/test the step just follow the **How to use this Step** section
5. Do the changes you want to
6. Run/test the step before sending your contribution
  * You can also test the step in your `bitrise` project, either on your Mac or on [bitrise.io](https://www.bitrise.io)
  * You just have to replace the step ID in your project's `bitrise.yml` with either a relative path, or with a git URL format
  * (relative) path format: instead of `- original-step-id:` use `- path::./relative/path/of/script/on/your/Mac:`
  * direct git URL format: instead of `- original-step-id:` use `- git::https://github.com/user/step.git@branch:`
  * You can find more example of alternative step referencing at: https://github.com/bitrise-io/bitrise/blob/master/_examples/tutorials/steps-and-workflows/bitrise.yml
7. Once you're done just commit your changes & create a Pull Request


## How to share this Step

You can share your Step or step version with the [bitrise CLI](https://github.com/bitrise-io/bitrise). If you use the `bitrise.yml` included in this repository, all you have to do is:

1. In your Terminal / Command Line `cd` into this directory (where the `bitrise.yml` of the step is located)
2. Run: `bitrise run test` to test the step
3. Run: `bitrise run audit-this-step` to audit the `step.yml`
4. Check the `share-this-step` workflow in the `bitrise.yml`, and fill out the
   `envs` if you haven't done so already (don't forget to bump the version number if this is an update
   of your step!)
5. Then run: `bitrise run share-this-step` to share the step (version) you specified in the `envs`
6. Send the Pull Request, as described in the logs of `bitrise run share-this-step`
