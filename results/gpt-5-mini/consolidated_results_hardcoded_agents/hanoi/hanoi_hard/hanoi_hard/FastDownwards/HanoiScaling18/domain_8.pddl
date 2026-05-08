(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    disk peg - place
    stage - object
  )

  (:predicates
    ;; Direct support relation: disk ?d is directly on place ?p (a disk or a peg)
    (on ?d - disk ?p - place)

    ;; Nothing on top of this place (disk or peg)
    (clear ?p - place)

    ;; Strict size ordering: ?big is larger than ?small
    (larger ?big - disk ?small - disk)

    ;; Discrete stage control: which stage is current and immediate successor relation
    (stage-current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)           ; ?d is directly on its support
      (clear ?d)              ; ?d is top of its stack
      (clear ?to)             ; target peg is empty (clear)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target peg now has something on it
      (not (clear ?to))

      ;; after removing ?d, its former support (?from) becomes clear
      (clear ?from)

      ;; moved disk has nothing on top (remains clear)
      (clear ?d)

      ;; advance discrete stage
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )

  ;; Move a top disk onto another disk that is clear and strictly larger
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ; ?d is top of its stack
      (clear ?to)          ; target disk has nothing on top
      (larger ?to ?d)      ; target disk is larger than moving disk
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target disk now has something on top
      (not (clear ?to))

      ;; after removing ?d, its former support (?from) becomes clear
      (clear ?from)

      ;; moved disk has nothing on top
      (clear ?d)

      ;; advance discrete stage
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )
)