-- OBJECTIVES: 
-- a. Develop some general recommendations about the price range, genre, content rating, or any other app characteristics that the company should target.
	-- Price range: FREE
	-- App store: IN BOTH
	-- Genre: GAMES
	-- CONTENT RATING: Everyone, 4+
		-- COUNT to confirm that they are the majority
-- b. Develop a Top 10 List of the apps that App Trader should buy based on profitability/return on investment as the sole priority.

-- c. Develop a Top 4 list of the apps that App Trader should buy that are profitable but that also are thematically appropriate for the upcoming 
	-- Fourth of July themed campaign.
-- Find apps that are in both stores AND
	-- Are FREE or low cost AND
	-- "Fall within Fourth of July consumer behavior" (from National Retail Federation, 2024)
		-- Spending time with family and friends (58%)
    	-- Grilling or barbecuing (56%)
    	-- Participating in public events (31%)
    	-- Preparing food at home (26%)
    	-- Hosting gatherings at their residence (18%)
			-- Ideas:
				-- Facebook
				-- Southwest Airlines
				-- Fly Delta
				-- Allrecipes
		
-- d. Submit a report based on your findings. The report should include both of your lists of apps along with your analysis of their cost and potential profits.

-- GOALS:
-- Cheapest app > highest payout
	-- DEFINE highest payout
		-- In both stores (~$5000 per month, double if both stores)
			-- 1 purchase will grant access to both stores, if the price is different between Apple App Store and Google play store choose the higher price.
			-- Factor for -$1000 a month for marketing (for one or both stores)
 		-- Low app price (=<$25,000)
		-- The minimum longevity for an app is 1 year and for every quarter-point that an app gains in rating, its projected lifespan increases by 6 months.
		-- 0 = 1 
		-- .25 = 1.5
		-- .5 = 2
		-- .75 = 2.5
		-- 1 = 3
		-- 1.25 = 3.5
		-- 1.5 = 4
		-- 1.75 = 4.5
		-- 2 = 5
		-- 2.25 = 5.5
		-- 2.5 = 6
		-- 2.75 = 6.5
		-- 3 = 7

		-- m-1000 * 12 * y - b = profit
		-- m = monthly income
			-- If in 1 store, then = 5000 - 1000
			-- If in 2 store, then = 10000 - 1000
		-- y = longivity
			-- BASE: 0 rating = 1 year
				-- +.25 rating = +.5 year
		-- b = buying price
			-- Price * 10000 OR 25000 (if price = 0)

		
		-- List price * 10,000
			-- Price 0-2.5

		-- HIGHER RATING = good
		-- LOWER PRICE = good
		-- HIGHER install_count = good
--

SELECT 
	DISTINCT (name), 
	p.rating AS google_rating,
	a.rating AS apple_rating,
	-- If the rating differs among stores, use the lower rating.
	-- CASE/WHEN: When either the google or apple rating is lower, show that rating
	p.price AS google_price,
	a.price AS apple_price,
	p.content_rating AS google_content_rating,
	a.content_rating AS apple_content_rating,
	genres AS google_genre, 
	primary_genre AS apple_genre
FROM play_store_apps AS p
JOIN app_store_apps AS a
USING (name)
WHERE p.price = '0'
	AND a.price = '0.00'
	AND primary_genre = 'Food & Drink'
	OR primary_genre = 'Travel'
	OR primary_genre = 'Social Networking'
ORDER BY p.rating DESC;
-- Is there a relationship between genre and how much money an app can make?
-- b. content rating?

--
SELECT *
FROM play_store_apps AS p
JOIN app_store_apps AS a
USING (name);

-- ASK YOURSELF:
	-- Which columns are used in this formula?
	-- Are all required inputs available in the data?

--LONGEVITY formula 
	-- y = 2(r) + 1
-- b  = 1 (crosses the y-axis)
-- Y = longevity
-- M = 0.25 rating → +0.5 years ⇒ 0.50/.25 = 2 (rate of change)
-- R = rating
	-- Ratings should be rounded to the nearest 0.25 to evaluate an app's likely longevity.  If the rating differs among stores, use the lower rating.
		-- i.e. if you have 1.23 rount to 1.25

--MONTHLY income formula
	-- m = (5000 * s) - 1000
-- M = monthly income
-- S = app stores

-- BUYING PRICE formula
	-- b      = 25,000         if p = 0 
	-- (or)   = p * 10,000     if p > 0
-- B = buying price
-- P = price in store

-- PROFIT formula
	-- p = m * 12 * y - b



		
			
			