(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing)

  (:types location person time)

  (:predicates
    (at ?person - person ?loc - location)
    (meeting_window ?person - person ?start - time ?end - time)
    (current_time ?time - time)
    (meeting_complete)
    (meeting_duration_met ?person1 - person ?person2 - person)
    (time-difference-sufficient ?start-time - time ?end-time - time)
  )

  ;; Visitor Actions (Agent 1)
  (:action visitor-travel
    :parameters (?from - location ?to - location ?start_time - time)
    :precondition (and 
      (at visitor ?from)
      (current_time ?start_time)
    )
    :effect (and 
      (not (at visitor ?from))
      (at visitor ?to)
    )
  )

  (:action visitor-meet
    :parameters (?person - person ?loc - location ?start_time - time ?end_time - time ?window_start - time ?window_end - time)
    :precondition (and
      (at visitor ?loc)
      (at ?person ?loc)
      (meeting_window ?person ?window_start ?window_end)
      (time-difference-sufficient ?start_time ?end_time)
    )
    :effect (meeting_complete)
  )
)