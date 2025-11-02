(define (problem stmt1-next-9-8)
  (:domain sequence-manipulation)
  ;; Assumptions:
  ;; - We model a single linear chain of objects using the binary predicate (next A B) meaning A is immediately before B.
  ;; - Actions to move an object require explicit knowledge of its immediate predecessor and successor as parameters.
  ;; - Three agent-specific move actions are available (move_before_agent1/2/3). Any of them may be used to perform the move.
  ;; - All objects are present and distinct; no additional objects or agents exist beyond those declared below.
  ;; - The initial chain for Statement 1 is:
  ;;     object_1 -> object_9 -> object_2 -> object_3 -> object_4 -> object_5 -> object_6 -> object_7 -> object_8
  ;;   This arrangement is encoded with the corresponding (next ...) facts below.
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
  )
  (:init
    (next object_1 object_9)
    (next object_9 object_2)
    (next object_2 object_3)
    (next object_3 object_4)
    (next object_4 object_5)
    (next object_5 object_6)
    (next object_6 object_7)
    (next object_7 object_8)
  )
  (:goal (and
    ;; Goal for Statement 1: object_9 must be immediately before object_8
    (next object_9 object_8)
  ))
)