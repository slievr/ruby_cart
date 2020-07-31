# RubyCart

A simple cart system for adding discounts.

Each type of discount had it's own class definition. Initially I thought about having a much simpler definition of the promotional criteria and passing functions, I decided against this as if it where me I'd like to store them in a database with discount codes that could apply them.

Function definitions stored in a db seems highly coupled to me, and generally ugly. So I decided against it.
The end solution isn't the cleanest and within the promotionalRules class there is property checking on symbols. The idea behind this is that if a rule is added that the system doesn't recognise from db(or wherever), that it gets ignored and doesn't effect the user (well they wouldn't get a discount).



## Running tests

```
bundle install

rspec
```

## Docker instructions

```
docker build . -t ruby_cart

docker run ruby_cart
```