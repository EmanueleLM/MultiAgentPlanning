(define (domain multi-agent-trip)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
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

  ;; Agent1 fly actions (day progression encoded symbolically)
  (:action fly-agent1-day1
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day1))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day1)) (day2)
    )
    :cost 1
  )

  (:action fly-agent1-day2
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day2))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day2)) (day3)
    )
    :cost 1
  )

  (:action fly-agent1-day3
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day3))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day3)) (day4)
    )
    :cost 1
  )

  (:action fly-agent1-day4
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day4))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day4)) (day5)
    )
    :cost 1
  )

  (:action fly-agent1-day5
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day5))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day5)) (day6)
    )
    :cost 1
  )

  (:action fly-agent1-day6
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day6))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day6)) (day7)
    )
    :cost 1
  )

  (:action fly-agent1-day7
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day7))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day7)) (day8)
    )
    :cost 1
  )

  (:action fly-agent1-day8
    :parameters (?from - city ?to - city)
    :precondition (and (at agent1 ?from) (flight ?from ?to) (day8))
    :effect (and
      (not (at agent1 ?from)) (at agent1 ?to) (visited agent1 ?to)
      (not (day8)) (day9)
    )
    :cost 1
  )

  ;; Agent1 stay actions (spend a full day in same city)
  (:action stay-agent1-day1
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day1))
    :effect (and
      (visited agent1 ?c)
      (not (day1)) (day2)
    )
    :cost 1
  )

  (:action stay-agent1-day2
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day2))
    :effect (and
      (visited agent1 ?c)
      (not (day2)) (day3)
    )
    :cost 1
  )

  (:action stay-agent1-day3
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day3))
    :effect (and
      (visited agent1 ?c)
      (not (day3)) (day4)
    )
    :cost 1
  )

  (:action stay-agent1-day4
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day4))
    :effect (and
      (visited agent1 ?c)
      (not (day4)) (day5)
    )
    :cost 1
  )

  (:action stay-agent1-day5
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day5))
    :effect (and
      (visited agent1 ?c)
      (not (day5)) (day6)
    )
    :cost 1
  )

  (:action stay-agent1-day6
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day6))
    :effect (and
      (visited agent1 ?c)
      (not (day6)) (day7)
    )
    :cost 1
  )

  (:action stay-agent1-day7
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day7))
    :effect (and
      (visited agent1 ?c)
      (not (day7)) (day8)
    )
    :cost 1
  )

  (:action stay-agent1-day8
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (day8))
    :effect (and
      (visited agent1 ?c)
      (not (day8)) (day9)
    )
    :cost 1
  )

  ;; Agent1 attend workshop actions only available on workshop days (day5..day8)
  (:action attend-agent1-day5
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (workshop ?c) (day5))
    :effect (and
      (attended-workshop agent1) (visited agent1 ?c)
      (not (day5)) (day6)
    )
    :cost 1
  )

  (:action attend-agent1-day6
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (workshop ?c) (day6))
    :effect (and
      (attended-workshop agent1) (visited agent1 ?c)
      (not (day6)) (day7)
    )
    :cost 1
  )

  (:action attend-agent1-day7
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (workshop ?c) (day7))
    :effect (and
      (attended-workshop agent1) (visited agent1 ?c)
      (not (day7)) (day8)
    )
    :cost 1
  )

  (:action attend-agent1-day8
    :parameters (?c - city)
    :precondition (and (at agent1 ?c) (workshop ?c) (day8))
    :effect (and
      (attended-workshop agent1) (visited agent1 ?c)
      (not (day8)) (day9)
    )
    :cost 1
  )

  ;; Agent2 fly actions
  (:action fly-agent2-day1
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day1))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day1)) (day2)
    )
    :cost 1
  )

  (:action fly-agent2-day2
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day2))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day2)) (day3)
    )
    :cost 1
  )

  (:action fly-agent2-day3
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day3))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day3)) (day4)
    )
    :cost 1
  )

  (:action fly-agent2-day4
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day4))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day4)) (day5)
    )
    :cost 1
  )

  (:action fly-agent2-day5
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day5))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day5)) (day6)
    )
    :cost 1
  )

  (:action fly-agent2-day6
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day6))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day6)) (day7)
    )
    :cost 1
  )

  (:action fly-agent2-day7
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day7))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day7)) (day8)
    )
    :cost 1
  )

  (:action fly-agent2-day8
    :parameters (?from - city ?to - city)
    :precondition (and (at agent2 ?from) (flight ?from ?to) (day8))
    :effect (and
      (not (at agent2 ?from)) (at agent2 ?to) (visited agent2 ?to)
      (not (day8)) (day9)
    )
    :cost 1
  )

  ;; Agent2 stay actions
  (:action stay-agent2-day1
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day1))
    :effect (and
      (visited agent2 ?c)
      (not (day1)) (day2)
    )
    :cost 1
  )

  (:action stay-agent2-day2
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day2))
    :effect (and
      (visited agent2 ?c)
      (not (day2)) (day3)
    )
    :cost 1
  )

  (:action stay-agent2-day3
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day3))
    :effect (and
      (visited agent2 ?c)
      (not (day3)) (day4)
    )
    :cost 1
  )

  (:action stay-agent2-day4
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day4))
    :effect (and
      (visited agent2 ?c)
      (not (day4)) (day5)
    )
    :cost 1
  )

  (:action stay-agent2-day5
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day5))
    :effect (and
      (visited agent2 ?c)
      (not (day5)) (day6)
    )
    :cost 1
  )

  (:action stay-agent2-day6
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day6))
    :effect (and
      (visited agent2 ?c)
      (not (day6)) (day7)
    )
    :cost 1
  )

  (:action stay-agent2-day7
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day7))
    :effect (and
      (visited agent2 ?c)
      (not (day7)) (day8)
    )
    :cost 1
  )

  (:action stay-agent2-day8
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (day8))
    :effect (and
      (visited agent2 ?c)
      (not (day8)) (day9)
    )
    :cost 1
  )

  ;; Agent2 attend workshop actions (day5..day8)
  (:action attend-agent2-day5
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (workshop ?c) (day5))
    :effect (and
      (attended-workshop agent2) (visited agent2 ?c)
      (not (day5)) (day6)
    )
    :cost 1
  )

  (:action attend-agent2-day6
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (workshop ?c) (day6))
    :effect (and
      (attended-workshop agent2) (visited agent2 ?c)
      (not (day6)) (day7)
    )
    :cost 1
  )

  (:action attend-agent2-day7
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (workshop ?c) (day7))
    :effect (and
      (attended-workshop agent2) (visited agent2 ?c)
      (not (day7)) (day8)
    )
    :cost 1
  )

  (:action attend-agent2-day8
    :parameters (?c - city)
    :precondition (and (at agent2 ?c) (workshop ?c) (day8))
    :effect (and
      (attended-workshop agent2) (visited agent2 ?c)
      (not (day8)) (day9)
    )
    :cost 1
  )
)