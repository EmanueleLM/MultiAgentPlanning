(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
          disk peg - place
          step - object)

  (:predicates
    ;; disk d is directly on place p (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; place (disk or peg) has nothing on top of it
    (clear ?p - place)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal progression control
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be clear).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ;; ?d is top of its stack
      (clear ?to)          ;; destination peg is empty on top
      (current ?s)
      (next ?s ?s2)
      (not (= ?from ?to))  ;; disallow no-op moves
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (destination disk must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)             ;; ?d is top of its stack
      (clear ?to)            ;; destination disk is top of its stack
      (smaller ?d ?to)       ;; size constraint: cannot place larger on smaller
      (current ?s)
      (next ?s ?s2)
      (not (= ?from ?to))    ;; disallow no-op moves
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?s))
      (current ?s2)
    )
  )
)