(define (domain cityplan)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city day fra-token buh-token
  )

  (:constants
    buh fra str - city
  )

  (:predicates
    (next ?d1 - day ?d2 - day)
    (now ?d - day)
    (last ?d - day)

    (loc ?c - city)           ; current city for the current "now" day
    (assigned ?d - day)       ; day has been committed to a city
    (at ?d - day ?c - city)   ; chosen city for a specific day

    (edge ?c1 - city ?c2 - city) ; direct flight availability (directed)

    (in-window ?d - day)      ; workshop window day (5..10)
    (workshop-done)           ; satisfied at least one STR day within window

    (available-fra ?t - fra-token)
    (available-buh ?t - buh-token)
    (used-fra ?t - fra-token)
    (used-buh ?t - buh-token)
  )

  (:functions
    (total-cost)
  )

  ; Stay in BUH for the current day and advance to next day
  (:action advance-stay-buh
    :parameters (?d - day ?d2 - day ?tb - buh-token)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc buh)
      (available-buh ?tb)
    )
    :effect (and
      (assigned ?d)
      (at ?d buh)
      (used-buh ?tb)
      (not (available-buh ?tb))
      (not (now ?d))
      (now ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Stay in FRA for the current day and advance to next day
  (:action advance-stay-fra
    :parameters (?d - day ?d2 - day ?tf - fra-token)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc fra)
      (available-fra ?tf)
    )
    :effect (and
      (assigned ?d)
      (at ?d fra)
      (used-fra ?tf)
      (not (available-fra ?tf))
      (not (now ?d))
      (now ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Stay in STR for the current day (day in window) and advance to next day
  (:action advance-stay-str-inwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc str)
      (in-window ?d)
    )
    :effect (and
      (assigned ?d)
      (at ?d str)
      (workshop-done)
      (not (now ?d))
      (now ?d2)
    )
  )

  ; Stay in STR for the current day (day NOT in window) and advance to next day
  (:action advance-stay-str-outwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc str)
      (not (in-window ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d str)
      (not (now ?d))
      (now ?d2)
    )
  )

  ; Fly BUH -> FRA while committing the current day as BUH
  (:action advance-fly-buh-to-fra
    :parameters (?d - day ?d2 - day ?tb - buh-token)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc buh)
      (edge buh fra)
      (available-buh ?tb)
    )
    :effect (and
      (assigned ?d)
      (at ?d buh)
      (used-buh ?tb)
      (not (available-buh ?tb))
      (not (loc buh))
      (loc fra)
      (not (now ?d))
      (now ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Fly FRA -> BUH while committing the current day as FRA
  (:action advance-fly-fra-to-buh
    :parameters (?d - day ?d2 - day ?tf - fra-token)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc fra)
      (edge fra buh)
      (available-fra ?tf)
    )
    :effect (and
      (assigned ?d)
      (at ?d fra)
      (used-fra ?tf)
      (not (available-fra ?tf))
      (not (loc fra))
      (loc buh)
      (not (now ?d))
      (now ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Fly FRA -> STR while committing the current day as FRA
  (:action advance-fly-fra-to-str
    :parameters (?d - day ?d2 - day ?tf - fra-token)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc fra)
      (edge fra str)
      (available-fra ?tf)
    )
    :effect (and
      (assigned ?d)
      (at ?d fra)
      (used-fra ?tf)
      (not (available-fra ?tf))
      (not (loc fra))
      (loc str)
      (not (now ?d))
      (now ?d2)
      (increase (total-cost) 1)
    )
  )

  ; Fly STR -> FRA (day in window), committing the current day as STR
  (:action advance-fly-str-to-fra-inwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc str)
      (edge str fra)
      (in-window ?d)
    )
    :effect (and
      (assigned ?d)
      (at ?d str)
      (workshop-done)
      (not (loc str))
      (loc fra)
      (not (now ?d))
      (now ?d2)
    )
  )

  ; Fly STR -> FRA (day NOT in window), committing the current day as STR
  (:action advance-fly-str-to-fra-outwindow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (now ?d) (next ?d ?d2)
      (loc str)
      (edge str fra)
      (not (in-window ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d str)
      (not (loc str))
      (loc fra)
      (not (now ?d))
      (now ?d2)
    )
  )

  ; Finalize the last day if in BUH
  (:action finalize-buh
    :parameters (?d - day ?tb - buh-token)
    :precondition (and
      (now ?d) (last ?d)
      (loc buh)
      (available-buh ?tb)
    )
    :effect (and
      (assigned ?d)
      (at ?d buh)
      (used-buh ?tb)
      (not (available-buh ?tb))
      (increase (total-cost) 1)
    )
  )

  ; Finalize the last day if in FRA
  (:action finalize-fra
    :parameters (?d - day ?tf - fra-token)
    :precondition (and
      (now ?d) (last ?d)
      (loc fra)
      (available-fra ?tf)
    )
    :effect (and
      (assigned ?d)
      (at ?d fra)
      (used-fra ?tf)
      (not (available-fra ?tf))
      (increase (total-cost) 1)
    )
  )

  ; Finalize the last day if in STR and the day is in the window
  (:action finalize-str-inwindow
    :parameters (?d - day)
    :precondition (and
      (now ?d) (last ?d)
      (loc str)
      (in-window ?d)
    )
    :effect (and
      (assigned ?d)
      (at ?d str)
      (workshop-done)
    )
  )

  ; Finalize the last day if in STR and the day is NOT in the window
  (:action finalize-str-outwindow
    :parameters (?d - day)
    :precondition (and
      (now ?d) (last ?d)
      (loc str)
      (not (in-window ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d str)
    )
  )

  (:metric minimize (total-cost))
)