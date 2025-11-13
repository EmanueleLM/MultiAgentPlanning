(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city amstoken)
  (:predicates
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (direct ?c1 - city ?c2 - city)
    (available_amsterdam_token ?t - amstoken)
    (consumed_amsterdam_token ?t - amstoken)
  )

  ;; Day 1 assignments (no predecessor required)
  (:action assign-day1-amsterdam
    :parameters (?t - amstoken)
    :precondition (and
                    (not (assigned day1))
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day1)
              (at day1 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  (:action assign-day1-istanbul
    :precondition (and
                    (not (assigned day1))
                  )
    :effect (and
              (assigned day1)
              (at day1 istanbul)
            )
  )

  ;; Amsterdam continuations (day2..day6) from Amsterdam predecessor
  (:action assign-day2-amsterdam-if-prev-amsterdam
    :parameters (?t - amstoken)
    :precondition (and
                    (at day1 amsterdam)
                    (not (assigned day2))
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day2)
              (at day2 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  (:action assign-day3-amsterdam-if-prev-amsterdam
    :parameters (?t - amstoken)
    :precondition (and
                    (at day2 amsterdam)
                    (not (assigned day3))
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day3)
              (at day3 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  (:action assign-day4-amsterdam-if-prev-amsterdam
    :parameters (?t - amstoken)
    :precondition (and
                    (at day3 amsterdam)
                    (not (assigned day4))
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day4)
              (at day4 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  (:action assign-day5-amsterdam-if-prev-amsterdam
    :parameters (?t - amstoken)
    :precondition (and
                    (at day4 amsterdam)
                    (not (assigned day5))
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day5)
              (at day5 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  (:action assign-day6-amsterdam-if-prev-amsterdam
    :parameters (?t - amstoken)
    :precondition (and
                    (at day5 amsterdam)
                    (not (assigned day6))
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day6)
              (at day6 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  ;; Move Amsterdam -> Istanbul on day7 (requires direct amsterdam->istanbul)
  (:action assign-day7-istanbul-if-prev-amsterdam
    :precondition (and
                    (at day6 amsterdam)
                    (not (assigned day7))
                    (direct amsterdam istanbul)
                  )
    :effect (and
              (assigned day7)
              (at day7 istanbul)
            )
  )

  ;; Istanbul continuations day8..day10 (stay same city)
  (:action assign-day8-istanbul-if-prev-istanbul
    :precondition (and
                    (at day7 istanbul)
                    (not (assigned day8))
                  )
    :effect (and
              (assigned day8)
              (at day8 istanbul)
            )
  )

  (:action assign-day9-istanbul-if-prev-istanbul
    :precondition (and
                    (at day8 istanbul)
                    (not (assigned day9))
                  )
    :effect (and
              (assigned day9)
              (at day9 istanbul)
            )
  )

  (:action assign-day10-istanbul-if-prev-istanbul
    :precondition (and
                    (at day9 istanbul)
                    (not (assigned day10))
                  )
    :effect (and
              (assigned day10)
              (at day10 istanbul)
            )
  )

  ;; Istanbul -> Amsterdam on day11 (requires direct istanbul->amsterdam)
  (:action assign-day11-amsterdam-if-prev-istanbul
    :parameters (?t - amstoken)
    :precondition (and
                    (at day10 istanbul)
                    (not (assigned day11))
                    (direct istanbul amsterdam)
                    (available_amsterdam_token ?t)
                  )
    :effect (and
              (assigned day11)
              (at day11 amsterdam)
              (consumed_amsterdam_token ?t)
              (not (available_amsterdam_token ?t))
            )
  )

  ;; Amsterdam -> Santorini on day12 (requires direct amsterdam->santorini)
  (:action assign-day12-santorini-if-prev-amsterdam
    :precondition (and
                    (at day11 amsterdam)
                    (not (assigned day12))
                    (direct amsterdam santorini)
                  )
    :effect (and
              (assigned day12)
              (at day12 santorini)
            )
  )

  ;; Stay Santorini day13 (prev santorini)
  (:action assign-day13-santorini-if-prev-santorini
    :precondition (and
                    (at day12 santorini)
                    (not (assigned day13))
                  )
    :effect (and
              (assigned day13)
              (at day13 santorini)
            )
  )

  ;; Stay Santorini day14 (prev santorini)
  (:action assign-day14-santorini-if-prev-santorini
    :precondition (and
                    (at day13 santorini)
                    (not (assigned day14))
                  )
    :effect (and
              (assigned day14)
              (at day14 santorini)
            )
  )
)