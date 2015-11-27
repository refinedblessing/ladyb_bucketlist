## Ladyb BucketList API
[![Code Climate](https://codeclimate.com/github/andela-bebowe/ladyb_bucketlist/badges/gpa.svg)](https://codeclimate.com/github/andela-bebowe/ladyb_bucketlist)
[![Test Coverage](https://codeclimate.com/github/andela-bebowe/ladyb_bucketlist/badges/coverage.svg)](https://codeclimate.com/github/andela-bebowe/ladyb_bucketlist/coverage)
[![Issue Count](https://codeclimate.com/github/andela-bebowe/ladyb_bucketlist/badges/issue_count.svg)](https://codeclimate.com/github/andela-bebowe/ladyb_bucketlist)
[![Coverage Status](https://coveralls.io/repos/andela-bebowe/ladyb_bucketlist/badge.svg?branch=master&service=github)](https://coveralls.io/github/andela-bebowe/ladyb_bucketlist?branch=master)

Rails API for a bucket list service.

Bucketlist API is an API that allows consumers to signup, create bucketlists and add items to their lists.

It is hosted on Heroku ( http://ladybucketlist.herokuapp.com/ )

This API was done by Miss Blessing Ebowe as part of the Andela program requirements.

## Description

* This is an API which can be used by a consumer to create Bucket lists to which he can add Items.
* To access this service the API consumer has to have signed up and log in, where he gets a token valid for 24 hours after which he has to log in again.
* CRUD operations can be carried out on the bucket list and an item within a bucket list.

## Features

Various EndPoints are available for this API see below.

|                       EndPoint                       |           Functionality           |
|:----------------------------------------------------:|:---------------------------------:|
|                   POST /auth/login                   |           Logs a user in          |
|                   GET /auth/logout                   |          Logs a user out          |
|                  POST /bucketlists/                  |      Create a new bucket list     |
|                   GET /bucketlists/                  | List all the created bucket lists |
|              GET /bucketlists/&lt;id&gt;             |       Get single bucket list      |
|                   PUT /bucketlists/                  |      Update this bucket list      |
|            DELETE /bucketlists/&lt;id&gt;            |   Delete this single bucket list  |
|          POST /bucketlists/&lt;id&gt;/items/         |  Create a new item in bucket list |
|   PUT /bucketlists/&lt;id&gt;/items/&lt;item_id&gt;  |     Update a bucket list item     |
| DELETE /bucketlists/&lt;id&gt;/items/&lt;item_id&gt; |  Delete an item in a bucket list  |

For complete API documentation visit ( http://docs.ladybbucketlist.apiary.io )

## Contributing

1. Fork it ( https://github.com/[andela-bebowe]/ladyb_bucketlist/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request.

## Development Dependencies

  * This API was built using rails-api.
  * JWT using ruby-jwt gem for token authentication
  * rack-cors gem for Cross Origin Resource Sharing setup
  * RSpec for testing.
