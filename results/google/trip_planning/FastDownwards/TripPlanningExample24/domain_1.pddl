(define (domain multi-agent-itinerary-orch)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (direct-flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (workshop-allowed ?d - day)
    (workshop-attended)

    (f-q0) (f-q1) (f-q2) (f-q3) (f-q4)
    (a-q0) (a-q1) (a-q2) (a-q3) (a-q4) (a-q5) (a-q6)
    (r-q0) (r-q1) (r-q2) (r-q3) (r-q4) (r-q5)
  )

  ;; Traveler: start in a city on a day (three variants, one per city)
  (:action traveler-start-florence
    :parameters (?d - day)
    :precondition (and (not (assigned ?d)))
    :effect (and
      (at florence ?d)
      (assigned ?d)
      (when (f-q4) (and (not (f-q4)) (f-q3)))
      (when (f-q3) (and (not (f-q3)) (f-q2)))
      (when (f-q2) (and (not (f-q2)) (f-q1)))
      (when (f-q1) (and (not (f-q1)) (f-q0)))
    )
  )

  (:action traveler-start-amsterdam
    :parameters (?d - day)
    :precondition (and (not (assigned ?d)))
    :effect (and
      (at amsterdam ?d)
      (assigned ?d)
      (when (a-q6) (and (not (a-q6)) (a-q5)))
      (when (a-q5) (and (not (a-q5)) (a-q4)))
      (when (a-q4) (and (not (a-q4)) (a-q3)))
      (when (a-q3) (and (not (a-q3)) (a-q2)))
      (when (a-q2) (and (not (a-q2)) (a-q1)))
      (when (a-q1) (and (not (a-q1)) (a-q0)))
    )
  )

  (:action traveler-start-riga
    :parameters (?d - day)
    :precondition (and (not (assigned ?d)))
    :effect (and
      (at riga ?d)
      (assigned ?d)
      (when (r-q5) (and (not (r-q5)) (r-q4)))
      (when (r-q4) (and (not (r-q4)) (r-q3)))
      (when (r-q3) (and (not (r-q3)) (r-q2)))
      (when (r-q2) (and (not (r-q2)) (r-q1)))
      (when (r-q1) (and (not (r-q1)) (r-q0)))
    )
  )

  ;; Traveler: stay in same city to next day (three variants)
  (:action traveler-stay-florence
    :parameters (?dprev - day ?dnext - day)
    :precondition (and (at florence ?dprev) (next ?dprev ?dnext) (not (assigned ?dnext)))
    :effect (and
      (at florence ?dnext)
      (assigned ?dnext)
      (when (f-q4) (and (not (f-q4)) (f-q3)))
      (when (f-q3) (and (not (f-q3)) (f-q2)))
      (when (f-q2) (and (not (f-q2)) (f-q1)))
      (when (f-q1) (and (not (f-q1)) (f-q0)))
    )
  )

  (:action traveler-stay-amsterdam
    :parameters (?dprev - day ?dnext - day)
    :precondition (and (at amsterdam ?dprev) (next ?dprev ?dnext) (not (assigned ?dnext)))
    :effect (and
      (at amsterdam ?dnext)
      (assigned ?dnext)
      (when (a-q6) (and (not (a-q6)) (a-q5)))
      (when (a-q5) (and (not (a-q5)) (a-q4)))
      (when (a-q4) (and (not (a-q4)) (a-q3)))
      (when (a-q3) (and (not (a-q3)) (a-q2)))
      (when (a-q2) (and (not (a-q2)) (a-q1)))
      (when (a-q1) (and (not (a-q1)) (a-q0)))
    )
  )

  (:action traveler-stay-riga
    :parameters (?dprev - day ?dnext - day)
    :precondition (and (at riga ?dprev) (next ?dprev ?dnext) (not (assigned ?dnext)))
    :effect (and
      (at riga ?dnext)
      (assigned ?dnext)
      (when (r-q5) (and (not (r-q5)) (r-q4)))
      (when (r-q4) (and (not (r-q4)) (r-q3)))
      (when (r-q3) (and (not (r-q3)) (r-q2)))
      (when (r-q2) (and (not (r-q2)) (r-q1)))
      (when (r-q1) (and (not (r-q1)) (r-q0)))
    )
  )

  ;; Flight planner: fly to a specific city (three variants). Only allowed if direct-flight exists.
  (:action flight-to-florence
    :parameters (?from - city ?dprev - day ?dnext - day)
    :precondition (and (direct-flight ?from florence) (at ?from ?dprev) (next ?dprev ?dnext) (not (assigned ?dnext)))
    :effect (and
      (at florence ?dnext)
      (assigned ?dnext)
      (when (f-q4) (and (not (f-q4)) (f-q3)))
      (when (f-q3) (and (not (f-q3)) (f-q2)))
      (when (f-q2) (and (not (f-q2)) (f-q1)))
      (when (f-q1) (and (not (f-q1)) (f-q0)))
    )
  )

  (:action flight-to-amsterdam
    :parameters (?from - city ?dprev - day ?dnext - day)
    :precondition (and (direct-flight ?from amsterdam) (at ?from ?dprev) (next ?dprev ?dnext) (not (assigned ?dnext)))
    :effect (and
      (at amsterdam ?dnext)
      (assigned ?dnext)
      (when (a-q6) (and (not (a-q6)) (a-q5)))
      (when (a-q5) (and (not (a-q5)) (a-q4)))
      (when (a-q4) (and (not (a-q4)) (a-q3)))
      (when (a-q3) (and (not (a-q3)) (a-q2)))
      (when (a-q2) (and (not (a-q2)) (a-q1)))
      (when (a-q1) (and (not (a-q1)) (a-q0)))
    )
  )

  (:action flight-to-riga
    :parameters (?from - city ?dprev - day ?dnext - day)
    :precondition (and (direct-flight ?from riga) (at ?from ?dprev) (next ?dprev ?dnext) (not (assigned ?dnext)))
    :effect (and
      (at riga ?dnext)
      (assigned ?dnext)
      (when (r-q5) (and (not (r-q5)) (r-q4)))
      (when (r-q4) (and (not (r-q4)) (r-q3)))
      (when (r-q3) (and (not (r-q3)) (r-q2)))
      (when (r-q2) (and (not (r-q2)) (r-q1)))
      (when (r-q1) (and (not (r-q1)) (r-q0)))
    )
  )

  ;; Attend workshop in Florence on an allowed day
  (:action traveler-attend-workshop
    :parameters (?d - day)
    :precondition (and (at florence ?d) (workshop-allowed ?d) (not (workshop-attended)))
    :effect (workshop-attended)
  )
)