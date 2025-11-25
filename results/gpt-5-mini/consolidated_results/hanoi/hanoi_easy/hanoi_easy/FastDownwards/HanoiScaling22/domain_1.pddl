(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)          ; disk ?d is directly on place ?p (peg or disk) in the current state
    (clear ?p - place)                ; nothing is directly on place ?p (it is the top) in the current state
    (can-be-on ?d - disk ?p - place)  ; static: disk ?d may legally be placed directly on place ?p
    (time ?s - step)                  ; the current time/stage is ?s
    (succ ?s1 - step ?s2 - step)      ; static successor relation between stages
  )

  ;; Move the top disk from one place to another and advance the global stage.
  ;; This enforces explicit discrete stage progression: an action is applicable only
  ;; if the current stage is ?s1 and its successor is ?s2; the action flips the current
  ;; stage from ?s1 to ?s2 and updates the on/clear relations accordingly.
  (:action move-disk
    :parameters (?d - disk ?from - place ?to - place ?s1 - step ?s2 - step)
    :precondition (and
      (time ?s1)
      (succ ?s1 ?s2)
      (on ?d ?from)
      (clear ?d)            ; ?d is the top disk on ?from
      (clear ?to)           ; destination place must be empty at this moment
      (can-be-on ?d ?to)    ; static legality (no larger-on-smaller)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (time ?s1))
      (time ?s2)
    )
  )
)