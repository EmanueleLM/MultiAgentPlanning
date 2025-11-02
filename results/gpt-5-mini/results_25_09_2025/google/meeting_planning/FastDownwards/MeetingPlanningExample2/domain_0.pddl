(define (domain scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )
  (:functions
    (time) ; numeric time in minutes since 9:00AM (time = 0 means 9:00AM)
  )

  ;; Visitor actions (distinct prefix "visitor-")
  (:action visitor-travel
    :parameters (?from - location ?to - location)
    :precondition (and (at visitor ?from))
    :effect (and
              (not (at visitor ?from))
              (at visitor ?to)
              (increase (time) 15) ; travel takes 15 minutes
            )
  )

  (:action visitor-wait-15
    :parameters ()
    :precondition ()
    :effect (and
              (increase (time) 15)
            )
  )

  ;; Jessica actions (distinct prefix "jessica-")
  ;; Jessica is modeled as available in the time window by numeric preconditions
  ;; She can "advance time" with an explicit wait action so multi-agent steps can progress.
  (:action jessica-wait-15
    :parameters ()
    :precondition ()
    :effect (and
              (increase (time) 15)
            )
  )

  ;; Meeting action: visitor meets Jessica at Sunset District for a block of time (90 minutes).
  ;; Preconditions enforce both agents are co-located at Sunset and the meeting fits entirely
  ;; within Jessica's availability window [375,675] minutes after 9:00 (i.e. 3:15PM to 8:15PM).
  (:action visitor-meet-jessica
    :parameters ()
    :precondition (and
                    (at visitor sunset)
                    (at jessica sunset)
                    (>= (time) 375)                ; meeting start not before 3:15PM
                    (<= (+ (time) 90) 675)        ; meeting end not after 8:15PM
                    (not (met visitor jessica))    ; not already met
                  )
    :effect (and
              (met visitor jessica)
              (increase (time) 90) ; meeting duration is 90 minutes
            )
  )
)