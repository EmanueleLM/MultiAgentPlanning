(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step support)
  ;; declare disk and peg as subtypes of support
  ;; using typing hierarchy: disk and peg are supports
  (:type-constants) ; placeholder to satisfy some parsers; no constants here

  (:predicates
    (on ?d - disk ?s - support)             ; disk d is directly on support s (disk or peg)
    (onpeg ?d - disk ?p - peg)              ; disk d's base peg is p
    (clear ?s - support)                    ; support s has nothing on top
    (smaller ?d1 - disk ?d2 - disk)         ; d1 is smaller than d2
    (planned-move ?st - step ?d - disk ?src - peg ?dst - peg) ; mapping step -> concrete move
    (next-step ?s1 - step ?s2 - step)       ; ordering of steps
    (enabled ?st - step)                    ; step is enabled to execute
    (done ?st - step)                       ; step has been executed
  )

  ;; move disk onto an empty peg, with successor step
  (:action move-to-empty
    :parameters (?st - step ?next - step ?d - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (clear ?dst)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?dst)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?dst))
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; move disk onto an empty peg, final step (no successor)
  (:action move-to-empty-final
    :parameters (?st - step ?d - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (clear ?dst)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?dst)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?dst))
      (not (enabled ?st))
      (done ?st)
    )
  )

  ;; move disk onto another disk, with successor step
  (:action move-to-disk
    :parameters (?st - step ?next - step ?d - disk ?t - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (next-step ?st ?next)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (on ?t ?dst)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?t)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?t))
      (not (enabled ?st))
      (done ?st)
      (enabled ?next)
    )
  )

  ;; move disk onto another disk, final step (no successor)
  (:action move-to-disk-final
    :parameters (?st - step ?d - disk ?t - disk ?support - support ?src - peg ?dst - peg)
    :precondition (and
      (planned-move ?st ?d ?src ?dst)
      (enabled ?st)
      (on ?d ?support)
      (onpeg ?d ?src)
      (clear ?d)
      (on ?t ?dst)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?t)
      (not (onpeg ?d ?src))
      (onpeg ?d ?dst)
      (clear ?support)
      (not (clear ?t))
      (not (enabled ?st))
      (done ?st)
    )
  )
)