### Glossary

  * spark
  * scrap (scraped when ignated by spark)
  * extract (extracted from scrap)
  * essence (filtered extract)

### Flow

  * creator
    * output: spark
  * igniter / invoker (daemon)
    * output
      * scraper data: request params, eg. 1. type=http, url; 2. type=soap; url; user; password; 3. type=file; location
      * extractors data
      * filters data
  * scraper (calls source and returns scrap)
    * input
      * data(s)
    * output
      * scrap or scraps
  * extractor (extracts data from scrap and puts into snip)
    * input
      * scrap
    * output
      * extract or extracts or nothing (if nothing extracted)
  * filter (transforms snips (sanitizer) or kills it (validator))
    * input
      * extract
    * output
      * essence or nothing

### Notes

  * handle http 304 not modified (if present, do nothing)
  * redis for duplicate detector filter

### Tools

#### MongoDB

#### Redis

  * config: maxmemory
  * //If your application is already able to perform application-level sharding, it is very advisable to run N instances of Redis 32bit against a big 64 bit Redis box (with more than 4GB of RAM) instead than a single 64 bit instance, as this is much more memory efficient.//
  * //Redis is single threaded, how can I exploit multiple CPU / cores? Simply start multiple instances of Redis in different ports in the same box and treat them as different servers!//

