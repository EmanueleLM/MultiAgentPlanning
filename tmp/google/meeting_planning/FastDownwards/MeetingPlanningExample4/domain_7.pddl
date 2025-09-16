(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing :fluents)

  (:types location person time)

  (:predicates
    (at ?person - person ?loc - location)
    (meeting_window ?person - person ?start - time ?end - time)
    (current_time ?time - time)
    (meeting_complete)
  )

  (:functions
    (travel_time ?from - location ?to - location)
    (meeting_duration ?person1 - person ?person2 - person)
  )

  ;; Visitor Actions (Agent 1)
  (:action visitor-travel
    :parameters (?from - location ?to - location ?start_time - time)
    :precondition (and 
      (at visitor ?from)
      (current_time ?start_time)
      (>= (travel_time ?from ?to) 0)
    )
    :effect (and 
      (not (at visitor ?from))
      (at visitor ?to)
    )
  )

  (:action visitor-meet
    :parameters (?person - person ?loc - location ?start_time - time ?end_time - time ?duration - time)
    :precondition (and
      (at visitor ?loc)
      (at ?person ?loc)
      (meeting_window ?person ?window_start ?window_end)
      (>= ?start_time ?window_start)
      (<= ?end_time ?window_end)
      (>= ?duration (meeting_duration visitor ?person))
      (= ?end_time (+ ?start_time ?duration))
    )
    :effect (meeting_complete)
  )
)