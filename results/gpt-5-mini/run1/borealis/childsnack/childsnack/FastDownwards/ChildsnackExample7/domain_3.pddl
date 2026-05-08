(define (domain child-snack)
  (:requirements :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)
  (:constants kitchen - place)

  (:predicates
    (at ?t - tray ?p - place)                       ; tray location
    (at_kitchen_bread ?b - bread-portion)          ; bread available in kitchen
    (at_kitchen_content ?c - content-portion)      ; content available in kitchen
    (no_gluten_bread ?b - bread-portion)           ; bread is gluten-free
    (no_gluten_content ?c - content-portion)       ; content is gluten-free
    (notexist ?s - sandwich)                       ; sandwich token not yet created
    (at_kitchen_sandwich ?s - sandwich)            ; sandwich exists and is in kitchen
    (on_tray ?s - sandwich ?t - tray)              ; sandwich placed on a tray
    (is_no_gluten ?s - sandwich)                   ; sandwich is gluten-free (safe for allergic)
    (allergic_gluten ?ch - child)                  ; child is allergic to gluten
    (not_allergic_gluten ?ch - child)              ; child explicitly marked not allergic (optional)
    (waiting ?ch - child ?p - place)               ; child is waiting at a place
    (served ?ch - child)                           ; child has been served a sandwich
  )

  ;; Make a gluten-free sandwich: consumes GF bread and GF content and produces a GF sandwich in the kitchen.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (is_no_gluten ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
    )
  )

  ;; Make a sandwich where the bread contains gluten (content may be GF or not).
  (:action make_sandwich_bread_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_bread ?b))
    )
    :effect (and
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; no is_no_gluten added -> sandwich may contain gluten
    )
  )

  ;; Make a sandwich where the content contains gluten (bread may be GF or not).
  (:action make_sandwich_content_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (notexist ?s)
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (not (no_gluten_content ?c))
    )
    :effect (and
      (not (notexist ?s))
      (at_kitchen_sandwich ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      ;; no is_no_gluten added -> sandwich may contain gluten
    )
  )

  ;; Place a prepared sandwich from the kitchen onto a tray that is in the kitchen.
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

  ;; Move a tray between places (sandwiches on the tray move with it implicitly).
  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )

  ;; Serve a gluten-free sandwich to a gluten-allergic child.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place)
    :precondition (and
      (allergic_gluten ?ch)
      (waiting ?ch ?p)
      (on_tray ?s ?tr)
      (at ?tr ?p)
      (is_no_gluten ?s)
    )
    :effect (and
      (not (on_tray ?s ?tr))
      (served ?ch)
      ;; the sandwich is consumed (it is no longer on a tray or in kitchen),
      ;; and its token remains used (we do not re-add (notexist ?s)), preventing reuse.
    )
  )

  ;; Serve a sandwich to a non-allergic child.
  (:action serve_sandwich
    :parameters (?s - sandwich ?ch - child ?tr - tray ?p - place)
    :precondition (and
      (not (allergic_gluten ?ch))
      (waiting ?ch ?p)
      (on_tray ?s ?tr)
      (at ?tr ?p)
    )
    :effect (and
      (not (on_tray ?s ?tr))
      (served ?ch)
      ;; consumed; token remains used (no (notexist ?s) re-added)
    )
  )

)