/**
 * Created by darcusfenix on 12/1/15.
 */

var TT = function() {

    var updateText = function() {
        $("#avance").change(function () {
            getValueRangeAvance();
        });
    };

    var getValueRangeAvance = function () {
        var valor = $("#avance").val();
        var span = $("#text-avance");
        $(span).html( "% " + valor );
    };

    return {
        init : function() {
            getValueRangeAvance();
            updateText();
        }
    };

}();