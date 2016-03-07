# ElmTime

Example of using Elm with Phoenix Channels

See http://www.cultivatehq.com/posts/phoenix-elm-11/ (and previous articles)

Further inspiration from [@jfcloutier](https://twitter.com/jfcloutier) in http://files.meetup.com/17314552/february_23_2016.pdf

To start the Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Open the JavaScript developer console and you will see
  * it join the channel,
  * after which the Phoenix app will push a "Welcome" message,
  * and then additional messages at random 1-10 second intervals

The "message" it displays is simply the date and time from `:calendar.local_time`.
