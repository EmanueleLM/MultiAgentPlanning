(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)               ; nothing on top of this place (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
    (at-step ?s - step)              ; current discrete stage
    (next ?s1 - step ?s2 - step)     ; successor relation for stages
  )

  ;; Move a top disk from any place onto a clear peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)        ; disk must be top of its current place
      (clear ?to)       ; destination peg must be clear on top
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to)) ; destination no longer clear (has ?d on it)
      (clear ?from)     ; source becomes clear after removing ?d
      (clear ?d)        ; moved disk has nothing on top (it is top)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk from any place onto a clear disk (destination disk must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)        ; moving disk must be top
      (clear ?to)       ; destination disk must have nothing on top
      (smaller ?d ?to)  ; cannot put larger disk onto smaller disk
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to)) ; destination disk now has ?d on top
      (clear ?from)     ; source becomes clear
      (clear ?d)        ; moved disk has nothing on top
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)