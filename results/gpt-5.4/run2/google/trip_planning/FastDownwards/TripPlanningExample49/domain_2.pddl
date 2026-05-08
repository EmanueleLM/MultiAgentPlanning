(define (domain tripplanningexample49)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (at ?c - city)
    (visited_on ?c - city ?d - day)
    (required_city ?d - day ?c - city)
    (window_day ?d - day)
    (window_satisfied)
    (finished)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )

  (:action satisfy_split_window
    :parameters (?d - day)
    :precondition (and
      (visited_on split ?d)
      (window_day ?d)
      (not (window_satisfied))
    )
    :effect (window_satisfied)
  )

  (:action finish
    :parameters ()
    :precondition (and
      (today day_13)
      (required_city day_1 split)
      (required_city day_2 split)
      (required_city day_3 split)
      (required_city day_4 reykjavik)
      (required_city day_5 reykjavik)
      (required_city day_6 reykjavik)
      (required_city day_7 reykjavik)
      (required_city day_8 milan)
      (required_city day_9 milan)
      (required_city day_10 milan)
      (required_city day_11 milan)
      (required_city day_12 milan)
      (required_city day_13 milan)
      (window_satisfied)
    )
    :effect (finished)
  )

  (:action assign_day_1_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_1)
      (not (required_city day_1 reykjavik))
      (not (required_city day_1 milan))
      (not (required_city day_1 split))
    )
    :effect (required_city day_1 reykjavik)
  )

  (:action assign_day_1_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_1)
      (not (required_city day_1 reykjavik))
      (not (required_city day_1 milan))
      (not (required_city day_1 split))
    )
    :effect (required_city day_1 milan)
  )

  (:action assign_day_1_split
    :parameters ()
    :precondition (and
      (visited_on split day_1)
      (not (required_city day_1 reykjavik))
      (not (required_city day_1 milan))
      (not (required_city day_1 split))
    )
    :effect (required_city day_1 split)
  )

  (:action assign_day_2_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_2)
      (not (required_city day_2 reykjavik))
      (not (required_city day_2 milan))
      (not (required_city day_2 split))
    )
    :effect (required_city day_2 reykjavik)
  )

  (:action assign_day_2_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_2)
      (not (required_city day_2 reykjavik))
      (not (required_city day_2 milan))
      (not (required_city day_2 split))
    )
    :effect (required_city day_2 milan)
  )

  (:action assign_day_2_split
    :parameters ()
    :precondition (and
      (visited_on split day_2)
      (not (required_city day_2 reykjavik))
      (not (required_city day_2 milan))
      (not (required_city day_2 split))
    )
    :effect (required_city day_2 split)
  )

  (:action assign_day_3_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_3)
      (not (required_city day_3 reykjavik))
      (not (required_city day_3 milan))
      (not (required_city day_3 split))
    )
    :effect (required_city day_3 reykjavik)
  )

  (:action assign_day_3_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_3)
      (not (required_city day_3 reykjavik))
      (not (required_city day_3 milan))
      (not (required_city day_3 split))
    )
    :effect (required_city day_3 milan)
  )

  (:action assign_day_3_split
    :parameters ()
    :precondition (and
      (visited_on split day_3)
      (not (required_city day_3 reykjavik))
      (not (required_city day_3 milan))
      (not (required_city day_3 split))
    )
    :effect (required_city day_3 split)
  )

  (:action assign_day_4_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_4)
      (not (required_city day_4 reykjavik))
      (not (required_city day_4 milan))
      (not (required_city day_4 split))
    )
    :effect (required_city day_4 reykjavik)
  )

  (:action assign_day_4_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_4)
      (not (required_city day_4 reykjavik))
      (not (required_city day_4 milan))
      (not (required_city day_4 split))
    )
    :effect (required_city day_4 milan)
  )

  (:action assign_day_4_split
    :parameters ()
    :precondition (and
      (visited_on split day_4)
      (not (required_city day_4 reykjavik))
      (not (required_city day_4 milan))
      (not (required_city day_4 split))
    )
    :effect (required_city day_4 split)
  )

  (:action assign_day_5_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_5)
      (not (required_city day_5 reykjavik))
      (not (required_city day_5 milan))
      (not (required_city day_5 split))
    )
    :effect (required_city day_5 reykjavik)
  )

  (:action assign_day_5_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_5)
      (not (required_city day_5 reykjavik))
      (not (required_city day_5 milan))
      (not (required_city day_5 split))
    )
    :effect (required_city day_5 milan)
  )

  (:action assign_day_5_split
    :parameters ()
    :precondition (and
      (visited_on split day_5)
      (not (required_city day_5 reykjavik))
      (not (required_city day_5 milan))
      (not (required_city day_5 split))
    )
    :effect (required_city day_5 split)
  )

  (:action assign_day_6_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_6)
      (not (required_city day_6 reykjavik))
      (not (required_city day_6 milan))
      (not (required_city day_6 split))
    )
    :effect (required_city day_6 reykjavik)
  )

  (:action assign_day_6_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_6)
      (not (required_city day_6 reykjavik))
      (not (required_city day_6 milan))
      (not (required_city day_6 split))
    )
    :effect (required_city day_6 milan)
  )

  (:action assign_day_6_split
    :parameters ()
    :precondition (and
      (visited_on split day_6)
      (not (required_city day_6 reykjavik))
      (not (required_city day_6 milan))
      (not (required_city day_6 split))
    )
    :effect (required_city day_6 split)
  )

  (:action assign_day_7_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_7)
      (not (required_city day_7 reykjavik))
      (not (required_city day_7 milan))
      (not (required_city day_7 split))
    )
    :effect (required_city day_7 reykjavik)
  )

  (:action assign_day_7_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_7)
      (not (required_city day_7 reykjavik))
      (not (required_city day_7 milan))
      (not (required_city day_7 split))
    )
    :effect (required_city day_7 milan)
  )

  (:action assign_day_7_split
    :parameters ()
    :precondition (and
      (visited_on split day_7)
      (not (required_city day_7 reykjavik))
      (not (required_city day_7 milan))
      (not (required_city day_7 split))
    )
    :effect (required_city day_7 split)
  )

  (:action assign_day_8_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_8)
      (not (required_city day_8 reykjavik))
      (not (required_city day_8 milan))
      (not (required_city day_8 split))
    )
    :effect (required_city day_8 reykjavik)
  )

  (:action assign_day_8_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_8)
      (not (required_city day_8 reykjavik))
      (not (required_city day_8 milan))
      (not (required_city day_8 split))
    )
    :effect (required_city day_8 milan)
  )

  (:action assign_day_8_split
    :parameters ()
    :precondition (and
      (visited_on split day_8)
      (not (required_city day_8 reykjavik))
      (not (required_city day_8 milan))
      (not (required_city day_8 split))
    )
    :effect (required_city day_8 split)
  )

  (:action assign_day_9_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_9)
      (not (required_city day_9 reykjavik))
      (not (required_city day_9 milan))
      (not (required_city day_9 split))
    )
    :effect (required_city day_9 reykjavik)
  )

  (:action assign_day_9_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_9)
      (not (required_city day_9 reykjavik))
      (not (required_city day_9 milan))
      (not (required_city day_9 split))
    )
    :effect (required_city day_9 milan)
  )

  (:action assign_day_9_split
    :parameters ()
    :precondition (and
      (visited_on split day_9)
      (not (required_city day_9 reykjavik))
      (not (required_city day_9 milan))
      (not (required_city day_9 split))
    )
    :effect (required_city day_9 split)
  )

  (:action assign_day_10_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_10)
      (not (required_city day_10 reykjavik))
      (not (required_city day_10 milan))
      (not (required_city day_10 split))
    )
    :effect (required_city day_10 reykjavik)
  )

  (:action assign_day_10_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_10)
      (not (required_city day_10 reykjavik))
      (not (required_city day_10 milan))
      (not (required_city day_10 split))
    )
    :effect (required_city day_10 milan)
  )

  (:action assign_day_10_split
    :parameters ()
    :precondition (and
      (visited_on split day_10)
      (not (required_city day_10 reykjavik))
      (not (required_city day_10 milan))
      (not (required_city day_10 split))
    )
    :effect (required_city day_10 split)
  )

  (:action assign_day_11_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_11)
      (not (required_city day_11 reykjavik))
      (not (required_city day_11 milan))
      (not (required_city day_11 split))
    )
    :effect (required_city day_11 reykjavik)
  )

  (:action assign_day_11_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_11)
      (not (required_city day_11 reykjavik))
      (not (required_city day_11 milan))
      (not (required_city day_11 split))
    )
    :effect (required_city day_11 milan)
  )

  (:action assign_day_11_split
    :parameters ()
    :precondition (and
      (visited_on split day_11)
      (not (required_city day_11 reykjavik))
      (not (required_city day_11 milan))
      (not (required_city day_11 split))
    )
    :effect (required_city day_11 split)
  )

  (:action assign_day_12_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_12)
      (not (required_city day_12 reykjavik))
      (not (required_city day_12 milan))
      (not (required_city day_12 split))
    )
    :effect (required_city day_12 reykjavik)
  )

  (:action assign_day_12_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_12)
      (not (required_city day_12 reykjavik))
      (not (required_city day_12 milan))
      (not (required_city day_12 split))
    )
    :effect (required_city day_12 milan)
  )

  (:action assign_day_12_split
    :parameters ()
    :precondition (and
      (visited_on split day_12)
      (not (required_city day_12 reykjavik))
      (not (required_city day_12 milan))
      (not (required_city day_12 split))
    )
    :effect (required_city day_12 split)
  )

  (:action assign_day_13_reykjavik
    :parameters ()
    :precondition (and
      (visited_on reykjavik day_13)
      (not (required_city day_13 reykjavik))
      (not (required_city day_13 milan))
      (not (required_city day_13 split))
    )
    :effect (required_city day_13 reykjavik)
  )

  (:action assign_day_13_milan
    :parameters ()
    :precondition (and
      (visited_on milan day_13)
      (not (required_city day_13 reykjavik))
      (not (required_city day_13 milan))
      (not (required_city day_13 split))
    )
    :effect (required_city day_13 milan)
  )

  (:action assign_day_13_split
    :parameters ()
    :precondition (and
      (visited_on split day_13)
      (not (required_city day_13 reykjavik))
      (not (required_city day_13 milan))
      (not (required_city day_13 split))
    )
    :effect (required_city day_13 split)
  )
)