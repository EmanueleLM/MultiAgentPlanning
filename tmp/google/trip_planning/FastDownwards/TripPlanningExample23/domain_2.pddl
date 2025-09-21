(define (domain multi-agent-trip)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :fluents :action-costs)
  (:types agent city)

  (:constants agent1 agent2 - agent)

  (:predicates
    (at ?ag - agent ?c - city)
    (flight ?from - city ?to - city)
    (workshop ?c - city)
    (attended-workshop ?ag - agent)
    (visited ?ag - agent ?c - city)
    (day1)
    (day2)
    (day3)
    (day4)
    (day5)
    (day6)
    (day7)
    (day8)
    (day9)
  )

  (:functions
    (total-cost)
  )

  ;; Agent1 actions
  (:action fly-agent1
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (not (day9)))
    :effect (and
      (not (at agent1 ?from))
      (at agent1 ?to)
      (visited agent1 ?to)
      (increase (total-cost) 1)
      (when (day1) (and (not (day1)) (day2)))
      (when (day2) (and (not (day2)) (day3)))
      (when (day3) (and (not (day3)) (day4)))
      (when (day4) (and (not (day4)) (day5)))
      (when (day5) (and (not (day5)) (day6)))
      (when (day6) (and (not (day6)) (day7)))
      (when (day7) (and (not (day7)) (day8)))
      (when (day8) (and (not (day8)) (day9)))
    )
  )

  (:action stay-agent1
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (not (day9)))
    :effect (and
      (visited agent1 ?c)
      (increase (total-cost) 1)
      (when (day1) (and (not (day1)) (day2)))
      (when (day2) (and (not (day2)) (day3)))
      (when (day3) (and (not (day3)) (day4)))
      (when (day4) (and (not (day4)) (day5)))
      (when (day5) (and (not (day5)) (day6)))
      (when (day6) (and (not (day6)) (day7)))
      (when (day7) (and (not (day7)) (day8)))
      (when (day8) (and (not (day8)) (day9)))
    )
  )

  (:action attend-agent1
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (workshop ?c) (or (day5) (day6) (day7) (day8)))
    :effect (and
      (attended-workshop agent1)
      (visited agent1 ?c)
      (increase (total-cost) 1)
      (when (day5) (and (not (day5)) (day6)))
      (when (day6) (and (not (day6)) (day7)))
      (when (day7) (and (not (day7)) (day8)))
      (when (day8) (and (not (day8)) (day9)))
    )
  )

  ;; Agent2 actions
  (:action fly-agent2
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (not (day9)))
    :effect (and
      (not (at agent2 ?from))
      (at agent2 ?to)
      (visited agent2 ?to)
      (increase (total-cost) 1)
      (when (day1) (and (not (day1)) (day2)))
      (when (day2) (and (not (day2)) (day3)))
      (when (day3) (and (not (day3)) (day4)))
      (when (day4) (and (not (day4)) (day5)))
      (when (day5) (and (not (day5)) (day6)))
      (when (day6) (and (not (day6)) (day7)))
      (when (day7) (and (not (day7)) (day8)))
      (when (day8) (and (not (day8)) (day9)))
    )
  )

  (:action stay-agent2
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (not (day9)))
    :effect (and
      (visited agent2 ?c)
      (increase (total-cost) 1)
      (when (day1) (and (not (day1)) (day2)))
      (when (day2) (and (not (day2)) (day3)))
      (when (day3) (and (not (day3)) (day4)))
      (when (day4) (and (not (day4)) (day5)))
      (when (day5) (and (not (day5)) (day6)))
      (when (day6) (and (not (day6)) (day7)))
      (when (day7) (and (not (day7)) (day8)))
      (when (day8) (and (not (day8)) (day9)))
    )
  )

  (:action attend-agent2
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (workshop ?c) (or (day5) (day6) (day7) (day8)))
    :effect (and
      (attended-workshop agent2)
      (visited agent2 ?c)
      (increase (total-cost) 1)
      (when (day5) (and (not (day5)) (day6)))
      (when (day6) (and (not (day6)) (day7)))
      (when (day7) (and (not (day7)) (day8)))
      (when (day8) (and (not (day8)) (day9)))
    )
  )
)