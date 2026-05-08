(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    ; Location and availability
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    
    ; Ingredient properties (Static)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    
    ; Sandwich status and properties
    (notexist ?s - sandwich)
    (at_kitchen_sandwich ?s - sandwich)
    (on_tray ?s - sandwich ?t - tray)
    (is_gluten_free ?s - sandwich)
    
    ; Child status and properties (Static/Goal)
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (waiting ?c - child ?p - place)
    (served ?c - child)
  )

  ; 1. make_sandwich_no_gluten: Makes a GF sandwich using only GF ingredients.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
      (notexist ?s)
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (is_gluten_free ?s)
    )
  )

  ; 2. make_sandwich: Makes a regular sandwich. Requires a regular ingredient (we mandate regular bread).
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (notexist ?s)
      (not (no_gluten_bread ?b)) ; Ensures bread has gluten (or is not guaranteed GF), making the resulting sandwich non-GF.
    )
    :effect (and
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      ; The sandwich is implicitly non-GF (lacks the is_gluten_free predicate)
    )
  )

  ; 3. put_on_tray: Places a sandwich onto a tray located in the kitchen.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (at_kitchen_sandwich ?s)
      (at ?t kitchen)
    )
    :effect (and
      (not (at_kitchen_sandwich ?s))
      (on_tray ?s ?t)
    )
  )

  ; 4. serve_sandwich_no_gluten: Serves a GF sandwich to an allergic child at the location P.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (is_gluten_free ?s)
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  ; 5. serve_sandwich: Serves a regular sandwich to a non-allergic child at the location P.
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (and
      (not_allergic_gluten ?c)
      (waiting ?c ?p)
      (on_tray ?s ?t)
      (at ?t ?p)
      (not (is_gluten_free ?s))
    )
    :effect (and
      (not (on_tray ?s ?t))
      (not (waiting ?c ?p))
      (served ?c)
    )
  )

  ; 6. move_tray: Moves a tray between two distinct places.
  (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)
    :precondition (and
      (at ?t ?p1)
      (not (= ?p1 ?p2))
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
)