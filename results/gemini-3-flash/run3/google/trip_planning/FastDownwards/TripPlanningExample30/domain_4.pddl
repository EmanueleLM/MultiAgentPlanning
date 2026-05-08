(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (conn ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
  )

  ;; Stay action: move from day d to nd while remaining in city c.
  ;; The city is counted as visited on the new day.
  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (next_day ?d ?nd)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd) 
      (visited ?c ?nd)
    )
  )

  ;; Fly action: move from day d to nd while flying from city f to t.
  ;; This transition credits both cities for the transition day d, 
  ;; and the destination city for the arrival day nd.
  (:action fly
    :parameters (?f - city ?t - city ?d - day ?nd - day)
    :precondition (and 
      (at ?f) 
      (current_day ?d) 
      (next_day ?d ?nd) 
      (conn ?f ?t)
    )
    :effect (and 
      (not (at ?f)) 
      (at ?t) 
      (not (current_day ?d)) 
      (current_day ?nd)
      (visited ?t ?d)
      (visited ?t ?nd)
    )
  )
)