(define (problem trip_planning_example6_problem)
  (:domain trip_planning_example6)

  (:objects
    berlin munich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    zero one two three four - staylen
  )

  (:init
    (direct berlin munich)
    (direct munich berlin)
    (direct munich dubrovnik)
    (direct dubrovnik munich)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (last_day day8)

    (dec_total four three)
    (dec_total three two)
    (dec_total two one)
    (dec_total one zero)

    (dec_block three two)
    (dec_block two one)
    (dec_block one zero)

    (current_day day1)
    (at berlin)

    (goal_city munich)
    (goal_city dubrovnik)

    (required_total berlin four)
    (required_total munich three)
    (required_total dubrovnik three)

    (remaining_total berlin four)
    (remaining_total munich three)
    (remaining_total dubrovnik three)

    (required_block munich three)
    (required_block dubrovnik three)
    (block_remaining zero)

    (conference day1 berlin)
    (conference day4 berlin)
  )

  (:goal
    (and
      (visited day1 berlin)
      (visited day4 berlin)
      (remaining_total berlin zero)
      (remaining_total munich zero)
      (remaining_total dubrovnik zero)
      (block_done munich)
      (block_done dubrovnik)
      (block_remaining zero)
      (not (current_day day1))
      (not (current_day day2))
      (not (current_day day3))
      (not (current_day day4))
      (not (current_day day5))
      (not (current_day day6))
      (not (current_day day7))
      (not (current_day day8))
    )
  )
)