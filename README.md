# Words

Words is an app that allows you save inspirational quotes
(or any piece of text) to a centralized location to access whenever you need a
motivational boost!

#### Backstory
I found myself saving quotes I found online to the Notes app on my phone, I'd
also bookmark tweets that I'd find thought provoking or inspirational. Sometimes,
I'd also bookmark web pages on my browser that held inspirational content. The
problem was that now I had to remember about all these different sources and
where they were saved when I wanted to go back and refer to them. So, I decided
to create one centralized location that I could refer back to with all this
content and periodically recieve this content via text or push notification.

## Setup & Installation

1. After cloning down this repo and `cd` into the directory, run:

```
bin/setup
```

This will install the necessary dependencies and prepare your local database.

2. Start your local dev server:

```
bin/rails server
```

3. Visit app in your browser at `localhost:3000`.

As of this writing, this app is meant to be mobile-first. Use your browser's
dev tools to view this as a mobile web browser.

4. If you'd like some dummy data for your dev environment, run:
```
bin/rails db:seed
```

## Running the Test Suite
To run the test suite, simply run:
```
bin/rspec
```
