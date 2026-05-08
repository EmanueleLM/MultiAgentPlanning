(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates 
    (at ?c - city ?d - day)
    (visited_reykjavik)
    (visited_milan)
    (visited_split)
    (next_day ?d1 - day ?d2 - day)
  )

  (:action fly_milan_reykjavik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at milan ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at milan ?d1)) (at reykjavik ?d2))
  )

  (:action fly_reykjavik_milan
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at reykjavik ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at reykjavik ?d1)) (at milan ?d2))
  )

  (:action fly_milan_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at milan ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at milan ?d1)) (at split ?d2))
  )

  (:action fly_split_milan
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at split ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at split ?d1)) (at milan ?d2))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  (:action satisfy_visit_reykjavik
    :precondition (and (at reykjavik day_1) (at reykjavik day_2) 
                       (at reykjavik day_3) (at reykjavik day_4) 
                       (at reykjavik day_5))
    :effect (visited_reykjavik)
  )

  (:action satisfy_visit_milan
    :precondition (and (at milan day_6) (at milan day_7) (at milan day_8) 
                       (at milan day_9) (at milan day_10) (at milan day_11) 
                       (at milan day_12))
    :effect (visited_milan)
  )

  (:action satisfy_visit_split
    :precondition (and (at split day_1) (at split day_2) (at split day_3))
    :effect (visited_split)
  )
)