(define (domain meeting-planning)
  (:requirements :strips :typing :fluents :negative-preconditions :numeric-fluents)
  (:types agent location)
  (:constants you joshua - agent
              union_square chinatown - location)

  (:predicates
    (at ?a - agent ?l - location)
  )

  (:functions
    (current-time)      ; minutes since 00:00
    (meet-minutes)      ; accumulated meeting minutes
  )

  ;; You travel from Union Square to Chinatown (7 minutes)
  (:action travel-you-us->ch
    :parameters ()
    :precondition (and (at you union_square) (<= (current-time) 1433))
    :effect (and (not (at you union_square)) (at you chinatown) (increase (current-time) 7))
  )

  ;; You travel from Chinatown to Union Square (7 minutes)
  (:action travel-you-ch->us
    :parameters ()
    :precondition (and (at you chinatown) (<= (current-time) 1433))
    :effect (and (not (at you chinatown)) (at you union_square) (increase (current-time) 7))
  )

  ;; You wait 1 minute while at Union Square
  (:action you-wait-at-us
    :parameters ()
    :precondition (and (at you union_square) (<= (current-time) 1439))
    :effect (increase (current-time) 1)
  )

  ;; You wait 1 minute while at Chinatown
  (:action you-wait-at-ch
    :parameters ()
    :precondition (and (at you chinatown) (<= (current-time) 1439))
    :effect (increase (current-time) 1)
  )

  ;; Joshua becomes present at Chinatown (can be executed at/after 18:00)
  (:action joshua-arrive-chinatown
    :parameters ()
    :precondition (and (not (at joshua chinatown)) (>= (current-time) 1080))
    :effect (and (at joshua chinatown))
  )

  ;; Joshua leaves Chinatown (can be executed at/after 21:30)
  (:action joshua-leave-chinatown
    :parameters ()
    :precondition (and (at joshua chinatown) (>= (current-time) 1290))
    :effect (and (not (at joshua chinatown)))
  )

  ;; Joshua waits 1 minute while at Chinatown (keeps him present; not strictly necessary but explicit)
  (:action joshua-wait-at-ch
    :parameters ()
    :precondition (and (at joshua chinatown) (<= (current-time) 1439))
    :effect (increase (current-time) 1)
  )

  ;; Meeting action executed by "you" when both present in Chinatown during Joshua's availability window.
  ;; Each execution accounts for 1 minute of meeting and advances time by 1.
  (:action you-meet-with-joshua
    :parameters ()
    :precondition (and
                   (at you chinatown)
                   (at joshua chinatown)
                   (>= (current-time) 1080)
                   (<= (current-time) 1289)  ; last minute of meeting counted when current-time == 1289
                  )
    :effect (and (increase (meet-minutes) 1) (increase (current-time) 1))
  )

)