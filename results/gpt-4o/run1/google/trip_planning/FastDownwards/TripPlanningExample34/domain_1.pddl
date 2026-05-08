(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day flight)
  
  (:predicates 
    (at ?c - city ?d - day)
    (flown ?f - flight ?d - day)
    (visited_relatives_valencia ?d - day)
    (sequence_valid ?d1 ?d2 - day)
  )
  
  (:action fly
    :parameters (?f - flight ?src - city ?dst - city ?d - day ?d_next - day)
    :precondition (and 
      (at ?src ?d)
      (sequence_valid ?d ?d_next)
      (not (flown ?f ?d))
      (or (and (equal_city ?f frankfurt_florence ?src frankfurt ?dst florence))
          (and (equal_city ?f florence_frankfurt ?src florence ?dst frankfurt))
          (and (equal_city ?f valencia_frankfurt ?src valencia ?dst frankfurt))
          (and (equal_city ?f frankfurt_valencia ?src frankfurt ?dst valencia)))
    )
    :effect (and 
      (not (at ?src ?d_next))
      (at ?dst ?d_next)
      (flown ?f ?d)
    )
  )
  
  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and 
      (at valencia ?d)
      (or (= ?d day1) (= ?d day2))
    )
    :effect (visited_relatives_valencia ?d)
  )
  
  (:functions (total-cost))
)