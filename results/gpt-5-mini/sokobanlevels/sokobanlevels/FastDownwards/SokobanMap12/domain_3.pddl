(define (domain sokoban_instance)
  (:requirements :typing :negative-preconditions :strips)
  (:types cell box player)

  (:predicates
    (at_box ?b - box ?c - cell)
    (at_player ?p - player ?c - cell)
    ;; between ?north ?middle ?south means: ?north is somewhere north of ?middle and
    ;; ?middle is somewhere north of ?south (a concise ordering invariant that stands for
    ;; a contiguous clear vertical corridor segment in this instance).
    (between ?north - cell ?middle - cell ?south - cell)
    ;; adjacent_south ?s ?n means ?s is directly south of ?n (used to place the player
    ;; correctly one cell south of a box after a sequence of pushes).
    (adjacent_south ?s - cell ?n - cell)
  )

  ;; Macro push that emulates the necessary sequence of pushes along the clear corridor:
  ;; it moves a single box from an intermediate cell ?from to a target ?to (north of ?from),
  ;; provided the player is somewhere south of the box and the three cells are ordered
  ;; (represented concisely by 'between'). The player ends up immediately south of the goal.
  (:action push_box_along
    :parameters (?b - box ?from - cell ?to - cell ?ps - cell ?gs - cell ?pl - player)
    :precondition (and
      (at_box ?b ?from)
      (at_player ?pl ?ps)
      (between ?to ?from ?ps)
      (adjacent_south ?gs ?to)
    )
    :effect (and
      (not (at_box ?b ?from))
      (at_box ?b ?to)
      (not (at_player ?pl ?ps))
      (at_player ?pl ?gs)
    )
  )
)