{{ config(
    materialized = 'view'
) }}

SELECT
    info.country_code,
    info.country_name,
    info.region,
    info.currency,
    info.language,
    
    pop.population_millions,
    pop.gdp_usd_billions,
    ROUND(pop.gdp_usd_billions * 1000.0 / pop.population_millions, 2) AS gdp_per_capita_k,
    
    internet.internet_users_millions,
    internet.mobile_subscriptions_millions,
    internet.sim_card_prefix
FROM {{ ref('country_info') }} AS info
JOIN {{ ref('country_population') }} AS pop
  ON info.country_code = pop.country_code
JOIN {{ ref('country_internet') }} AS internet
  ON info.country_code = internet.country_code
