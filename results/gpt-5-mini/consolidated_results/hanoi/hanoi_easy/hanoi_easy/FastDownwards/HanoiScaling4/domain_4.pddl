(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    (disk ?x - obj)
    (peg ?x - obj)
    ;; ?p can be a peg or a disk (place)
    (on ?d - obj ?p - obj)         ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - obj)               ; nothing on top of this place (disk or peg)
    (smaller ?d1 - obj ?d2 - obj)  ; size ordering: ?d1 is smaller than ?d2 (static)
    (at-step ?s - step)            ; current discrete stage
    (next ?s1 - step ?s2 - step)   ; successor relation for stages
  )

  ;; Move a top disk from any place onto a clear peg
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?to - obj ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)        ; disk must be top of its current place
      (clear ?to)       ; destination peg must be empty on top
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to)) ; destination is no longer clear (has ?d on it)
      (clear ?from)     ; source place becomes clear after removing ?d
      (clear ?d)        ; moved disk has nothing on top
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  ;; Move a top disk from any place onto a clear disk (destination disk must be larger)
  (:action move-to-disk
    :parameters (?d - obj ?from - obj ?to - obj ?s - step ?s2 - step)
    :precondition (and
      (disk ?d)
      (disk ?to)
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
      (clear ?from)     ; source place becomes clear
      (clear ?d)        ; moved disk has nothing on top
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)