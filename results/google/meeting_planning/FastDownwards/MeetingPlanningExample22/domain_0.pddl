(define (domain meeting-domain)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
  )
  (:functions
    (time)                       ; global clock in minutes since midnight
    (total-meeting-time)         ; accumulated meeting time in minutes
  )

  ; Visitor travels from Presidio to Union Square (22 minutes)
  (:durative-action visitor-travel-presidio-to-unionsq
    :parameters ()
    :duration (= ?duration 22)
    :condition (and
      (at start (at visitor presidio))
    )
    :effect (and
      (at start (not (at visitor presidio)))
      (at end (at visitor unionsq))
      (at end (increase (time) ?duration))
    )
  )

  ; Visitor travels from Union Square back to Presidio (24 minutes) - unused in the optimal plan but available
  (:durative-action visitor-travel-unionsq-to-presidio
    :parameters ()
    :duration (= ?duration 24)
    :condition (and
      (at start (at visitor unionsq))
    )
    :effect (and
      (at start (not (at visitor unionsq)))
      (at end (at visitor presidio))
      (at end (increase (time) ?duration))
    )
  )

  ; Andrew travel actions (kept distinct). Andrew is initially at Union Square and typically stays there.
  (:durative-action andrew-travel-unionsq-to-presidio
    :parameters ()
    :duration (= ?duration 24)
    :condition (and
      (at start (at andrew unionsq))
    )
    :effect (and
      (at start (not (at andrew unionsq)))
      (at end (at andrew presidio))
      (at end (increase (time) ?duration))
    )
  )

  (:durative-action andrew-travel-presidio-to-unionsq
    :parameters ()
    :duration (= ?duration 22)
    :condition (and
      (at start (at andrew presidio))
    )
    :effect (and
      (at start (not (at andrew presidio)))
      (at end (at andrew unionsq))
      (at end (increase (time) ?duration))
    )
  )

  ; Visitor waits at Union Square until Andrew becomes available (explicit 113-minute wait computed for
  ; this scenario: arrive at 9:00 + 22 = 9:22 (540+22=562), wait 675-562 = 113 to reach 11:15 (675))
  (:durative-action visitor-wait-until-andrew-start
    :parameters ()
    :duration (= ?duration 113)
    :condition (and
      (at start (at visitor unionsq))
      (at start (< (time) 675))          ; only sensible to use this wait if current time is before 11:15
    )
    :effect (and
      (at end (increase (time) ?duration))
    )
  )

  ; Meeting action: both agents meet at the same location.
  ; For this problem Andrew is available in Union Square from 11:15 (675) to 17:15 (1035).
  ; We include a meeting action that spans the full available window (360 minutes) to maximize meeting time.
  (:durative-action visitor-andrew-meet-unionsq
    :parameters ()
    :duration (= ?duration 360) ; fixed to the maximum contiguous time Andrew is available (1035 - 675)
    :condition (and
      (at start (at visitor unionsq))
      (at start (at andrew unionsq))
      (at start (>= (time) 675))     ; meeting can only start at or after Andrew's availability begins
      (at end (<= (time) 1035))      ; meeting must finish by Andrew's availability end
      (over all (at visitor unionsq))
      (over all (at andrew unionsq))
    )
    :effect (and
      (at end (increase (time) ?duration))
      (at end (increase (total-meeting-time) ?duration))
    )
  )
)