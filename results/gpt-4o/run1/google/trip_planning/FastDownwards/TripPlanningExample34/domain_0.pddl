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
      (or (and (equal ?f frankfurt_florence) (equal ?src frankfurt) (equal ?dst florence))
          (and (equal ?f florence_frankfurt) (equal ?src florence) (equal ?dst frankfurt))
          (and (equal ?f valencia_frankfurt) (equal ?src valencia) (equal ?dst frankfurt))
          (and (equal ?f frankfurt_valencia) (equal ?src frankfurt) (equal ?dst valencia)))
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
      (or (equal ?d day1) (equal ?d day2))
    )
    :effect (visited_relatives_valencia ?d)
  )
)