(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place
  )

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or another disk)
    (clear ?p - place)              ; nothing is directly on place ?p (peg empty or disk has no disk on it)
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2 (size ordering)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg)
    :precondition (and
      (on ?d ?from)          ; ?d is directly on ?from
      (clear ?d)             ; ?d has nothing on it (is top)
      (clear ?peg)           ; target peg has nothing on it (empty)
      (not (= ?from ?peg))   ; must change location
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))     ; peg now has the moved disk on top
      (clear ?from)          ; the previous support becomes clear (top removed)
    )
  )

  ;; Move a top disk onto another disk (only if moving disk is smaller than the target disk)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?target - disk)
    :precondition (and
      (on ?d ?from)            ; ?d is directly on ?from
      (clear ?d)               ; ?d is top
      (clear ?target)          ; the target disk has nothing on it (is top)
      (smaller ?d ?target)     ; enforce no larger-on-smaller placements
      (not (= ?from ?target))  ; must change location
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (not (clear ?target))    ; target disk now has something on it
      (clear ?from)            ; previous support becomes clear
    )
  )
)