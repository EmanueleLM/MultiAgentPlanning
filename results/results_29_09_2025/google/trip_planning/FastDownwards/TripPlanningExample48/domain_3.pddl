(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs :equality :adl)
  (:types city day preference)
  (:predicates
    (free-day ?d - day)
    (at ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (pref-sat ?p - preference)
  )
  (:action assign-day1
    :parameters (?c - city)
    :precondition (free-day day1)
    :effect (and (at ?c day1) (not (free-day day1)))
    :cost 0
  )
  (:action assign-next-stay
    :parameters (?c - city ?pd - day ?d - day)
    :precondition (and (free-day ?d) (next ?pd ?d) (at ?c ?pd))
    :effect (and (at ?c ?d) (not (free-day ?d)))
    :cost 0
  )
  (:action assign-next-fly
    :parameters (?from - city ?to - city ?pd - day ?d - day)
    :precondition (and (free-day ?d) (next ?pd ?d) (at ?from ?pd) (direct ?from ?to))
    :effect (and (at ?to ?d) (not (free-day ?d)))
    :cost 0
  )
  (:action pay-pref
    :parameters (?p - preference)
    :precondition (not (pref-sat ?p))
    :effect (pref-sat ?p)
    :cost 1
  )
  (:action satisfy-pref-split-12
    :parameters ()
    :precondition (and (at Split day1) (at Split day2))
    :effect (pref-sat pref-split-12)
    :cost 0
  )
  (:action satisfy-pref-split-13
    :parameters ()
    :precondition (and (at Split day1) (at Split day3))
    :effect (pref-sat pref-split-13)
    :cost 0
  )
  (:action satisfy-pref-split-14
    :parameters ()
    :precondition (and (at Split day1) (at Split day4))
    :effect (pref-sat pref-split-14)
    :cost 0
  )
  (:action satisfy-pref-split-23
    :parameters ()
    :precondition (and (at Split day2) (at Split day3))
    :effect (pref-sat pref-split-23)
    :cost 0
  )
  (:action satisfy-pref-split-24
    :parameters ()
    :precondition (and (at Split day2) (at Split day4))
    :effect (pref-sat pref-split-24)
    :cost 0
  )
  (:action satisfy-pref-split-34
    :parameters ()
    :precondition (and (at Split day3) (at Split day4))
    :effect (pref-sat pref-split-34)
    :cost 0
  )
  (:action satisfy-pref-man-12
    :parameters ()
    :precondition (and (at Manchester day1) (at Manchester day2))
    :effect (pref-sat pref-man-12)
    :cost 0
  )
  (:action satisfy-pref-man-13
    :parameters ()
    :precondition (and (at Manchester day1) (at Manchester day3))
    :effect (pref-sat pref-man-13)
    :cost 0
  )
  (:action satisfy-pref-man-14
    :parameters ()
    :precondition (and (at Manchester day1) (at Manchester day4))
    :effect (pref-sat pref-man-14)
    :cost 0
  )
  (:action satisfy-pref-man-23
    :parameters ()
    :precondition (and (at Manchester day2) (at Manchester day3))
    :effect (pref-sat pref-man-23)
    :cost 0
  )
  (:action satisfy-pref-man-24
    :parameters ()
    :precondition (and (at Manchester day2) (at Manchester day4))
    :effect (pref-sat pref-man-24)
    :cost 0
  )
  (:action satisfy-pref-man-34
    :parameters ()
    :precondition (and (at Manchester day3) (at Manchester day4))
    :effect (pref-sat pref-man-34)
    :cost 0
  )
  (:action satisfy-pref-geneva-12
    :parameters ()
    :precondition (and (at Geneva day1) (at Geneva day2))
    :effect (pref-sat pref-geneva-12)
    :cost 0
  )
  (:action satisfy-pref-geneva-13
    :parameters ()
    :precondition (and (at Geneva day1) (at Geneva day3))
    :effect (pref-sat pref-geneva-13)
    :cost 0
  )
  (:action satisfy-pref-geneva-14
    :parameters ()
    :precondition (and (at Geneva day1) (at Geneva day4))
    :effect (pref-sat pref-geneva-14)
    :cost 0
  )
  (:action satisfy-pref-geneva-23
    :parameters ()
    :precondition (and (at Geneva day2) (at Geneva day3))
    :effect (pref-sat pref-geneva-23)
    :cost 0
  )
  (:action satisfy-pref-geneva-24
    :parameters ()
    :precondition (and (at Geneva day2) (at Geneva day4))
    :effect (pref-sat pref-geneva-24)
    :cost 0
  )
  (:action satisfy-pref-geneva-34
    :parameters ()
    :precondition (and (at Geneva day3) (at Geneva day4))
    :effect (pref-sat pref-geneva-34)
    :cost 0
  )
)