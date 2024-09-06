PGDMP                       |            Desafio_Dourasoft    16.4    16.4 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16469    Desafio_Dourasoft    DATABASE     �   CREATE DATABASE "Desafio_Dourasoft" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 #   DROP DATABASE "Desafio_Dourasoft";
                postgres    false            �            1259    16471 	   cadastros    TABLE     =  CREATE TABLE public.cadastros (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    documento character varying(20) NOT NULL,
    cep character varying(20) NOT NULL,
    estado character varying(15) NOT NULL,
    cidade character varying(25) NOT NULL,
    endereco character varying(50) NOT NULL
);
    DROP TABLE public.cadastros;
       public         heap    postgres    false            �            1259    16470    cadastros_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cadastros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cadastros_id_seq;
       public          postgres    false    216                       0    0    cadastros_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cadastros_id_seq OWNED BY public.cadastros.id;
          public          postgres    false    215            �            1259    16486    cadastros_tags    TABLE     T   CREATE TABLE public.cadastros_tags (
    cadastro_id integer,
    tag_id integer
);
 "   DROP TABLE public.cadastros_tags;
       public         heap    postgres    false            �            1259    16500 
   categorias    TABLE     g   CREATE TABLE public.categorias (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    16499    categorias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categorias_id_seq;
       public          postgres    false    221                       0    0    categorias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
          public          postgres    false    220            �            1259    16507    lancamentos    TABLE     �  CREATE TABLE public.lancamentos (
    id integer NOT NULL,
    tipo character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
    descricao character varying(255) NOT NULL,
    valor numeric(10,2) NOT NULL,
    valor_liquidado numeric(10,2) DEFAULT 0,
    vencimento date NOT NULL,
    liquidacao date,
    cadastro_id integer,
    categoria_id integer,
    CONSTRAINT lancamentos_status_check CHECK (((status)::text = ANY ((ARRAY['aberto'::character varying, 'liquidado'::character varying])::text[]))),
    CONSTRAINT lancamentos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['pagar'::character varying, 'receber'::character varying])::text[])))
);
    DROP TABLE public.lancamentos;
       public         heap    postgres    false            �            1259    16506    lancamentos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lancamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lancamentos_id_seq;
       public          postgres    false    223                       0    0    lancamentos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.lancamentos_id_seq OWNED BY public.lancamentos.id;
          public          postgres    false    222            �            1259    16480    tags    TABLE     a   CREATE TABLE public.tags (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16479    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public          postgres    false    218                       0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public          postgres    false    217            c           2604    16474    cadastros id    DEFAULT     l   ALTER TABLE ONLY public.cadastros ALTER COLUMN id SET DEFAULT nextval('public.cadastros_id_seq'::regclass);
 ;   ALTER TABLE public.cadastros ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            e           2604    16503    categorias id    DEFAULT     n   ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
 <   ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            f           2604    16510    lancamentos id    DEFAULT     p   ALTER TABLE ONLY public.lancamentos ALTER COLUMN id SET DEFAULT nextval('public.lancamentos_id_seq'::regclass);
 =   ALTER TABLE public.lancamentos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            d           2604    16483    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                      0    16471 	   cadastros 
   TABLE DATA           W   COPY public.cadastros (id, nome, documento, cep, estado, cidade, endereco) FROM stdin;
    public          postgres    false    216   �-                 0    16486    cadastros_tags 
   TABLE DATA           =   COPY public.cadastros_tags (cadastro_id, tag_id) FROM stdin;
    public          postgres    false    219   �@                 0    16500 
   categorias 
   TABLE DATA           0   COPY public.categorias (id, titulo) FROM stdin;
    public          postgres    false    221   YB                 0    16507    lancamentos 
   TABLE DATA           �   COPY public.lancamentos (id, tipo, status, descricao, valor, valor_liquidado, vencimento, liquidacao, cadastro_id, categoria_id) FROM stdin;
    public          postgres    false    223   C       
          0    16480    tags 
   TABLE DATA           *   COPY public.tags (id, titulo) FROM stdin;
    public          postgres    false    218   �                  0    0    cadastros_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cadastros_id_seq', 100, true);
          public          postgres    false    215                       0    0    categorias_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categorias_id_seq', 10, true);
          public          postgres    false    220                       0    0    lancamentos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.lancamentos_id_seq', 7001, true);
          public          postgres    false    222                       0    0    tags_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tags_id_seq', 10, true);
          public          postgres    false    217            k           2606    16526 !   cadastros cadastros_documento_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.cadastros
    ADD CONSTRAINT cadastros_documento_key UNIQUE (documento);
 K   ALTER TABLE ONLY public.cadastros DROP CONSTRAINT cadastros_documento_key;
       public            postgres    false    216            m           2606    16476    cadastros cadastros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cadastros
    ADD CONSTRAINT cadastros_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.cadastros DROP CONSTRAINT cadastros_pkey;
       public            postgres    false    216            q           2606    16505    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    221            s           2606    16514    lancamentos lancamentos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lancamentos
    ADD CONSTRAINT lancamentos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.lancamentos DROP CONSTRAINT lancamentos_pkey;
       public            postgres    false    223            o           2606    16485    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    218            t           2606    16489 .   cadastros_tags cadastros_tags_cadastro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cadastros_tags
    ADD CONSTRAINT cadastros_tags_cadastro_id_fkey FOREIGN KEY (cadastro_id) REFERENCES public.cadastros(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.cadastros_tags DROP CONSTRAINT cadastros_tags_cadastro_id_fkey;
       public          postgres    false    4717    216    219            u           2606    16494 )   cadastros_tags cadastros_tags_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cadastros_tags
    ADD CONSTRAINT cadastros_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.cadastros_tags DROP CONSTRAINT cadastros_tags_tag_id_fkey;
       public          postgres    false    219    218    4719            v           2606    16515 (   lancamentos lancamentos_cadastro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lancamentos
    ADD CONSTRAINT lancamentos_cadastro_id_fkey FOREIGN KEY (cadastro_id) REFERENCES public.cadastros(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.lancamentos DROP CONSTRAINT lancamentos_cadastro_id_fkey;
       public          postgres    false    216    4717    223            w           2606    16520 )   lancamentos lancamentos_categoria_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lancamentos
    ADD CONSTRAINT lancamentos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.lancamentos DROP CONSTRAINT lancamentos_categoria_id_fkey;
       public          postgres    false    223    4721    221                  x�e��r۸������H� H��i�����̤֪}K��EzH�����$}��IU&N@�������]��Kz^��U;��/}�&��eY�N��bQd�������Z�t���+U��Ʀ�7�Ϫi�Ĩ�*n��zh�е�����2s����Q�9kE��:n:u�?�uTV{���quy|���G�&��̺J?��iŲ(����ia�e�P�E�v>�{�Gl�n�mz�}צ�}lW�$W������'��We��.C1�f�
�K,�\�����mT?�a���f��Vq�Q>���^mx�*=kꇇ�P��>��������L/Mi����d��ʽ7n��U�(�����:��}�Ҫ��"���-/��:&�:����R��(�5z�r/���q*/J�fi�]w�oҳ�wM�}�����X�AiS��iw�?�qH����v,gŏK��e�4���l�eʚ�޸Ҩo]ϱ�q����l*�x����pez[��#w=��US%^��v�cz���=��¥��Ӆym��ve�0y9U�����:��jkẒ�MO��>6��@���Uw���{#�ϊe^�TNu5H��7^�uM��u�>U�S�s��-�n��
����s��VV�e�-���niU���Zg���7q��T�9���}�^����Dk�G_��ԓ�^b3���z�2wZՋB+�K��g=��v�[u��q��b�����5���ݣmԗئ�ݦO�R6[��Qp�=sAS�4}2�WU��i��dO�r�sr\Ӱ�C�0'���(�~_5�șpN3�&�Uil(.s����Zuy��6�w����C\m�?�Y':W'�}��]zѯ���uKo�c���e�x�����Oq�4l�R�]=06��H�K�������!�ܵ ����J���.��&6ʭ�.~,��}�1Z��!��L�Y�C�E�\���{uۭ���P��Ֆ��WY�#��\;�-�����*n����ko࠼O\���,�N���7�~}� U	���~,c����m�]T�BH]z����9���`!��=>0V?c��`^��L�
��_:�h�
v���[EK�mT��~�T�jD�,�	m�2]��~@=���Un��K�g���^�.��eT�mQ_AeUAR��T�|&&S_ǣA��P�)�{��ކ��s?�~^������-
Ku���b���huMOg_w<�>�/�����*s�`�`ԏ�8( V7{�����F2S!�Qw�ȵ�qq��ŨJ����Hg]��s&Թ�����R�F��܏8fRcb���f�љ�rJ�vR'�(5��P�\�%ֵ��)�t^Y��Чz�P���*����6��ϟ?+�X��X;Q4�g��^^̂����;�tf�Mx�8H�S�sX�n�?�z?pO�����v*g@�l^RN�� ��s���mڷٲ�q����y_?CS��^��M
_�`����m�R;p���~�.����vU-.G��4�����m��4�gs]m�Y�O����S��U�?��G��z �\���.�I@��H�և��3pt�����,c��	�T�:W��������C�l�w\���12��M��zrM���C���X*0V�Ba�B�1$�e�	���#B�|үS�ӣ�Z8�f���"�����k�iZ��x7U ���vGe՟��Qg�)֏��%dҁ!4��U�N�8*��,��������r�S��D���j���AZR��Ě�O]��̩�#̴c
�	Y^+���[�wm�����=:+y�3f:��}ݵ	�{^�'�}^u��H�v"U�R���l�r���(�i�u�M|�pڥ�0�m�(5E�D��u��J$&3f�j�J�d�����.�u{��b櫢��:������DҖ�b��<����KY�R8��m7� @�� �T����-�	��ߺ�Ub�
S,�|�<��B����k��z�O���P��Y���Z��w���!2�-Q���E��B/P����"D�U(]��z����G�?Ub���u��	�I�g�W�S4O�i�u��G��=N屉�r��cëCǽ����x�"�YV
P� P����G6�b[�M��?ZA	o���v<�{�_��h����S�
��?��q>M�
yA=�裥y	a�oӯݯJͬN�5���z��_}��e�Xq���?�6����1��kn�k!�(F���r"W(���G ��������I4�xpPH��E_�02ĭ�]��t�x��G��׫�^���ZJ����C��4�WL��H���97nF8x1oӅ1,r�K$�ɱ��֏x��T�jk�5Ú�k�(/	��%��?�dlX�0;7��y�4*C�D��ں�b3��gc�_@^��c�@I��"��/��ω�������4�VM�2�1B�2�I��7�#����̰���e�&�<��k�rT+�Ŗ�\p��UݐI�1����<����_vl�cǣ����8��L,SJp3^�f?T���U�$�d�L"�Q�e�*�Mo�B9;z�$��sx��1�.l�����h`�~�4�[Җf=2:�ZU/�����1��Ƥ,I�s��,�$M�aU�H��~,��8�s���0s`��ma$5���n|�&���s�W6���zթ����,�@:�j[��k$�ҵ+��c/F�X)�lNHVep�x�)�����tͶ˔1�?��G4�z�b\]�Cz��3(2�!�3�xp��,�2CU��j���CEy�8��"!�>%���uz��p�eYh3��5����:��u��	�q�f\7�+N����×���V����:�č���2�����T��@�su��?�1��dD~�Bo��b8���3`�p�d2n���O�}�ק�h���K�s�@u/�e4p��9�n�r�[����r�Y!�E[?*�oN��9�QdL
;No������ײ+]jj�z�#H����N������B��]�8�#���E�y&x�s���	2�Iu�!�Y 0��ߛ��y(9rl�����0�߸3��%n�݋�iSBr�́>�(�U����y�v'�u;,��0,�<��9�"�������H�eS:���h30lW|&�&���s%)E�/�Q�*�NEp��ʠ�X�-���,\�NE��Ց�<z���t�?��v��z�H��G��r�h��M����Nה�]�NPذ�t_�v��SR�?���y��a�
+���|��+��d��:;�����x�}��,c}Z��n�s�dy�F�^y��]���q%J�E'��a
��]+�����"f�dw��5����5�t(v��Z������W) b��kL|��Du��آ�1G��kӭ��d-�x7��,��!��+�����/��rz|$���a܇����vE1>�m��������*0�ed�q#e��!��u��MR�8���Y:��9"gIS��s8�2-�dݽ􇔴^��m�s5�h��H��5��sn�odqYR��#E��ּ69x�~�����nX�����
��)�g:5.{�Vy�����d����Qp�O �/�lϺ~W�����9�-#1ޢӈ*�.��e��}�wH��!�]V��M�U1��Ҕ��/��}��go.HP�31�BQ��s��%7��1�¥UߊƊ� @@�t.�sc�E�<�TCw8J ������;�)9�b��������Ai�s d�����ߖg��S�,/������	����.=6h�)� � A �|����QV̅%��z�Zɚ]���q��PIye��M��(�G3���`*�c<��]��z�)L�yՀ�����=�A�]�	U��T �8b������90�y&��?[n5��Ŵh߬��M��׋9�c�@�?��٦��P@|�^��0���(��l����Tʙ��߁�%��� ��HE�j��VqO2��y�j�?����z��^�{�FR�ލ{7]��t���,ɨ�T�������c�q�x3zJ.{@%eݮ<R"��͞2�X�O���"�$B��H�'�~ӵGA��C�'̻�W>md�|���j�e��K &  ��,<���l�o{�y�w+sa�1V��	��[�ɿ���V��fs.˧������8�ǻ|?�	�IC�;�J�3��3%!pu�����d�rY�gٌ�rg�ûo������͊��&W\�+��˶90��D�-U�!�$�{g6��
�g���g0; T3��a��m�p����(\����N�&N���+�B��YG�/�$'Ӟ�1�&��$մ4K��I���T�|�y}rrn�s�	Yy!��~Z��#@|���&�$;���3��Q&^aš8�0��>��K�$��r��.z�&��d�i{$K�F������p�>�����3���r��J�V7��|�!FÊ��l�{�on�Z��'��|" �8����GhCCi�@1W�}-��8iY�	8fHBx��|��G���H�r���[�'���l������5�����šo<`�oɇ#��ӓZ�v��r�}�ʪ�?ݰsb��dFs�Jo�b�z/���V0K�kfnL`гͨ6@��]��[��ћ2��I��E2�$�>q#� ��-i_;�u6,�y�LO�����Y��o�80O=���;��_Ez���Nb2���W}�e�_�-����L�}��3r�����̾�N04�Z]�>1\�D�b��ա���z�k��I����K?�˯��9�,(.̓�¸/p�g\�bc@S�oRT�y[G��5i$�b�I!�l�"��~��qGK�1�&gz�� �d-C�����E��H�^^ħ\3�Ɋ�n�<oX;;��c�?�����a.��.�$�?�dj�         `  x�=�Kr1C��0)������爞=�MWB�ȶ,�m�j��ln--�;��Z����8A�fRU�����V��HF�J��*��4�&V�6�g�iq(6�
	�K4��Zٺ�{hJN%���WV��5T�Nc,M��hP�d;��:4}Y��4K<G�r�N\W����[��rL-1��Fqݶ;�n��E�����9�`�-/��
3���-�9�[N�zPW2~�Ɂ� �sQ�~h��ʰ���cRظ�"V�����]�������1С��d���H����0��I|^q�f\��s�k��o��Z� �q_��#СS�pL����zR6x�s��,U[������ � i�         �   x�E�M
�0��3��	���^�
bQ��Ml�Iɤ�눋$3Q����}9lHZ%ٖJp�/*�8<{b�)Mk�[����+���L�&vq��^�;y67\@EF����.�P:��^6-?�`�EEv����c�������2ɓ���y��xD/#D|��G=            x��}]�.9��s�*f�A�?�x�R��0������!?^Go�<��"�!�ӽy��T�"�s����������������������o������������o|e>�~��_����	?����\z㏿�������C���>%� ��S�_	�ԓ�x�%��y*��(�a����_��?��������'�e6��8�����o�1|B[f�S_�<�.������S���C�_d������DtY|�x3H�%�v��_�����ˣz�<*G˒���ä�I5}e�V�p:�}�:^����b�/o������1Z���y1�.�O��L_~	��%�$w�A���5���[�}�'��O.vmO��Owq�@_>5/G����\}Z�kMJ������ ��D�ѹm�-�C�������������������8�9\�Lw)�G�����_9��<�ݮ�ӇVԻ\p��9ֱ}d�Wn2n;�kn�������l��5��z���<�1Dd??�|��?���(c��&��y��0N���|��I�Z~���ceCO7������Ɋ�`o�����W���p��ڧҩ�l�����~�/.��v̇c&ڤ�����v�&徤͂�]�tܱ�1}z�.��{24j�n�TG!}�+d�Z� �ǁr�G��isH��W����x��ɻv��U���̛����o����Wz�҇����'艺v*`�d�pJs8�����L'?^w_vJ�~���A7ۯ�\������p�IYS^�FyAry� ��١FS.jO\��J6�����ݷv�����dMK�n�e�إ�| �fY���OЇ�@�Pu�x͓�,�F�ӫZ����|���n��0�rvL3�gz)2l��y��.;_�w�G�7��X?=��H�"[_7O�Z�?t{zv�Z����^�h�7���^@-IgI�3]vS����'2O�lz'{�z��e�i�?���s�n����1�	u�=E���Uŝ�g�NS�	j>}|�����#�"��ݱind��:z���*v�V�t&^Pz���� �nV��y)�&��d�;{m��}�+T����'d�뭬�	I��h�J���'�����!����=����Z��ءx`�+�jǓ*����q@���w#�3�;��x#�!���^��Q�pD��Ag�`�,~u8�d2���k��v:X��<�1H���J����EdD���!f��fq�H��0��We�Wf�����
w��h"���(F�~X��%c�w�����χи tq[��iYfT���e����%2�+Q=d�ՏoW�(��%�bȢ��\�vL����D#cy���2;��ǭp�D^3v�=A���0�f��gqdў��<8���vE���E��|��_k,�T��~>����Gd��O��y��M��8>�5˻��,�\ɓs������ ���h`�������p�ĩ�e�������`h���M��ȟ��GF�q�1�a��`M�)���=�+%�h�/zD����e�i�� "��}�2�����
�.F�i${��5�A�xi��!/�B�q��7X�G�̘��)ڳ&��إS��vs$�������MN����Ì�6X�5Pj����M*r��)��#�S�i�}k<Ny��O��O�v������r]k��mw3���|�t,�r����a��<���������������6�JLV��
�";�UN�1���u������EчgNx���s81ѵO�jz�,@�eM/@�"ö�?a"\Qוq�<n�&z^A�:�����(O��{�w��.,�;�٧V��L0����*��X?ӫH�3��is	h��4e�C|=�$Cl��z�j��5( �|���$�����1F�������9�%|��&�����Y����<��������=�֮��;�!�k��������?������������i���'(<y�]Ѷb��Yd��E(l��x͖7�KLo�����$r`Kx%l���g��BT��I��S(Ars�A_ʟj��8'�^ď�)�5%�a��������ik�ҏj�8��2�4[�GB"�xF��C�+��(@�n2٘�Y^{:�6��3�C����!����Ky>��,Ѿ�{ޛ�GN)��F��]�#��a�jV�^6;R���r3��ؓz]�8�c�<���F��������'� ,��d�wƍ�72.=%m��ʧ�1������Q
���٣��}xs��_,ɕ���q/���f�~d$rvؾ�#�%ѾEgI�U>�>?f��O˖��e�`?�Ʀ����b�$<�����
�����S��8O��S,uY��l�t���q($2�aX�(�L;&u��t{po����xOi��:�*�3��O��~k�'�/�ٹ&_�]9��9�����/޺���F���HJZ֦��c�C2��	G��Ԅ	�"<���Ea��Q�u�4�g챚:R�f��+��gl�����VdŠB<c9z ��oH$9�E�v��w��EH�G/h�,�ų�\,�K�-AA$7�^���U��3w2�.�af��ϠOj�vM�IJ�}�ʹ�p;��������N�ai�A�nn���˭~|�7i$��t�p��Y*��*��=�����3�r�Yq����#C���q����+�*�����T&~�c]�SH��	p���Ua��X~R`</����:Q��� �U�I����Fc�I��JzoM���<��/��������`DH�r77�I!�r�_��g"7+C������.�po�`gD��kx�	K
#�7 �p��&��T���0�ɭ�L�s�������E�AV���pc�'4�6n�L�]@KE6
��n��[�[��Z���~�|�bz�(�������J�PS��,&V!�7d���v%�����lQ��3�����
MO@C,��j�0�(�Sbș�D�{��k�&l���%FpU�e3%P�dDWY_�}q���:���њh��`f�_KJ_6�Ռ�g�}=M�: ތS��Nf����.L߱�^I̧�{�^վ�Oy.��v�9KE��3a�bhy0�[��n:��!���`��a�;�a`It>9�A2�6Is!�n� V���]#��_�a���~u:�~	����p�ez�mx>q'Ϭ���s�,�Ʈ�+�1z{���aR~K:���F	&�
i���e�n<w1}<���(�ye�^�S�'9d
�����I.t 3p���!�P�R�-o��5L�3%�(g`L�E^A���2�3&F�]�?���E��'-��i^��C�*:o���6 a�{�4�)p*K�/g��4|�#����7��K1ʢ8s�i[�B7�G��m�[�ͮ�v�	�6��)ʔ����qrO�=��VÍ� Q;�1�]b�`��������[ �0�s�2�ӆY��~\��p���+�Ρ[�����㪾��ǭ���2||�#_J�����g�"{��3�P=��r)�@�=:,�ua�\EpM��&�o�Q
����
GSQU�Lu�Y���L�����ъ?bW&G�&�Q�DY˒7�	�òO�n��`W�g��O�BψV]���3zs�n֗ �%E�ܓ'�/�:0��G����r���W�!��"�I�V8�g��D60��bt�HS�(	|�(�"(G 2�'b�HS
�<pZ_�'�P����f�i�k��8��+�eFeg 3�㒋Z�U�>�z��z^�p��$�@F8�]��)7���"����1R�g��!�W�g���n:����܂-۲��W^�����i2��]�sL%(/(�G�]���K�J»������� �� !?GQj�j�3��!�Q 7K��t�i�O�=heh��#�P�3��al�f�X�	��ݮ|�.U�Wg�+-��Q^��A (2���҂��]��vr\7���U$o3Du<���P����(Z��:��W:��r%|��L9�\qÑQ����[�gI~܌�	�u��3    ��� <�g��аW�-��1����z���x(���ig��B�2 ��q�x��i�i�n���~����17�������E�%=����~�Ċ]�}:�0���,�D��1[�ŵ���^d�%��X
��~�]�l8m�i�*g~_x�S��o�t�!����qP�_<r/�җ��P���������(xa
���Y	4>b&���������.��Ku�C�O�7��X�4�Jt��9�e�0�U0�m)��	(\��j��U�k2�R?[��V��73�#�0Ĥh���eD���_\N7���H�%w���A�aL�Prb0�Ie6V%��@��&]�piq�=K��1i���k�OoKb6Ι��;Y+L��̣��N�a��6<�ݫ�HU%��i�$�v��TK	� <����aq����^|�C\|�@GQ�5⯌�79�g�2��T�!j�
]�̐[,o�W�cы\���]�(�i��V3ۙ��
�M<������T��W��G�͵���K�C����
}���-�CFC��ɧ�8`Y����|�SI��_��X��y��c"MIZ< f�R�INbʇ$�ӎ�w���b\Ae#<<��>��
:��/!7N�Ey�mJ;Ɠy �B4�#)u�ZS�P|���n��������5�wV��k�8��Y�"�3<Ĝ��ŕ�+zT���'�TAbNKȃ��|� �#^s+q�l��UFl��v.un6B2���5��Imk��b��X4��\+My��e��!/i�Y�Rƌ�` X��Cmĳ���؞o�7O����!�XX9ĸ�d9>K�m���)���l�'4 �gׯ�<#�H�PG	s�@��"5�|�2([�K�y�fr|��1�9��$y�$�<Of}�cY�Xf`YY!�eZ�Y�ڪ�B�(͆��V�9�9�rc�Dذe{�*�X_��� �:ڷ=�]��g�=%���Ч,��a<��'ǈH��&��a?�����ӭ�b$e�	I��
+�ږ��}KuF�d��*[2�rD��	a�~?xW�R����.]ba�@O���<�IF8K���q[I�U	֤.E�J�.��#[߂�A�'9x�U�~����d�nʤb��*)\�,W� SmR:اJ�C���d��gw �{e�G�� ��|�/�`8�ײ$�>���@�)�����s�&�L�=7��xi��=�,qF�b�i*�g�v�m3\Yq��T�����Q��8�N;[W\\�ˤY�1�*�zsI��a|�#��R�M/7g���/�c�R�P'/ܮ�Q�k��@�4�0jU�WF��Y�3ټN�M�w�S�4�8�B�a�Ϣ�9T�zѤ�`;3�"��K]�)��k�o�.�������	�NP�1��#��A�a"�R���U\C
,��؆{9�I�S�j��&�;.�5_�9���HQ�/h���%ĥ�L�N��7%2(��Y��R?&�p�oe�"��:���PX�3�A#�YU�,Y�c锖��Is��d*�LΑ(٦]���7��W��f����`~���F��a1�H~�1qx�\����� �g^�h�GUt�"E���y�=�&%0p�)*��k�äs���R9�/���.J=cz!�P|�UA���C��Cr���,�<F:R���D^�sR7�d����4鼔e�`���9$����O��P�L���At��٬�2��s������Z+􉴑q\dXz��؁)3�DS|hl�(��RӪ9�"��65K7ힼ��'�W��&�C���z�20Δ��������vb��ʭ�o����c�C2��f�gH���Mz̳�QzS� #!ם��g(�E�.����=�W�|X��e���ٞ��l �BE��Gy���|���4�r��m�+-���1b��,���	����<a�3�5�R(�L�G!?�9��/�J.���!���Bs����	蘌�@_�?B���ˇ,��e���E�F�PX",��BP"#T����jH��	DM	C~��X*ӳ-92�A�t�.Ii	�/3!>k>�PJOzjf|���Ԥ�M��A�� _���*0S���t���[~�4��nI�͋]�0���Lp�ir����L�q�_�W�cl�	Y�6yW2���Rx�(,�Gڂ��B�0k�4��l�� �����p'ʐ?I���AE=��Wrxд�/3-���D/z�J��{mw����J���n�(����K��\oT�zl���o�!��׿�������_���	*n/o⛽j��#�G]E��VF�m8/�h�u�Y��Pr�N5���ȁ��3Gm��B��?�sB�c��8��YU�K:���;A���P�e���y���M)�!o�����>$��l��yGF��ы�����	�p!����R����$#���J9nj������P�k�dIxPc���IZ�Z����Rp$u�x�M������3R7�+�Q���Fa�	L���TS!�p����:��Ⱦ,���~�eB�-�t�6�&�md��o��#"��T0 �a64�ʳ�c�ϕ%�Ƭ,�:��&��|&.Y�4�TOA?D�9�H���E�1��=u��A� X�* �S�Jl��ܳL�Q�4���[�NJ�*�l��� xfa	)�|��M��SC��ߨo&ٴ�@�;��/ � �Jo:��Q�^�6���e�r>�G<�EXXYj]���fY,��	�������k�L!f�X)`�;e��O68�Ǐ�-���7��Q�Te��p.�|+~6�ӓ�Q�s��!�	�
���O~�j�Ґu)���j��X~�]��6$�ֵ���"�#�-��K:�}����G�uS���U��)g=�!BP��b�&� �j��jR��Ұ�d�]3_���]m�*ݒ�l�<B63E ��B2��%i�ˎ��C8��O�M����$���4���!�Ɠӹ~˰Ü*��5)m���C;�h�!�RBe�]�2���Io�l�jɈdyd�}UH�Pm�ؿ<2�lp��R_��ź>�VV�6����8����Ո��u���*q�s�^��.%z�3���i̒,o���ȍ�]s��b�W����J$1�+�R�טQ ,C(z�L�Ȇ
G|�qEw8@��>�tv�B~���j�Ehw5i������?9Ȩ�OX|*��MZ���g ��M�
ء/��������m/
H���G�@AU�K��!!��w�#W����Te���iG/���Za��:����gp1X+�2+ �P�eJ �MO����[ja��78X�ed�L��ka��/6�L�Nıj�s��V5y�w�W5^c;E�}m��tZ:�vB��smㆆ��#�\�ԫ��KU�y� ѕbyO`�v>��V��*n��cKKZ��T�����\�/�E�*W���ݨ6���1{��(�l?�a=�}7�trچ�>���l��ym6H�Ibk��Sc>��uЍJ��7��N�.ӣ������)f�]]
�'�³ZC9ƾJ����51VP6������#i9�v�M{���/��6�s���M����:���M\C��
�i�6��� V���쩓@���hD�q�n2� e�5�
�e���X<�#��i�өnڹ$�l �u�}ўA2�	���SP�:��?�I2�Y��$��Apzk������pYu�-̷��� F9n6��!���<ʣ,���Z�fB�*�z9#h�xI�Q��|��c�˃�v��`wb��SB�q��A��k�")��BN�Ta�WE�vzUِ��,�6?�]���M)A�i�4+�
�Ʋ���V�U^�*�X{�	������c#^��Qܷ�S荃��(i���::�g°d}$��=&����L���r�jXH<���H�����){̣W�Ÿ��L�s!��G|h��8�tۺjl�`e�Hy-��w�Qs���W��%弈=DEAf0�|��B����FMѵ��f-E{xm\����A5����(<��	�kV7�x��"����~�&�g��A,��]j�N�&��������    ��J-��4��8-�'���Ok��)���
j�t�|M�tW���ĴS���Lb�Ҋ����hZ��e�΢3�E5�T����%߭|N�JT��N�ZD��ړ}�Ap��J���ij��8*�.�Tsp5ץᑵڇ���_�Ժ�K�X��Ȕ6[��"��q���u��u��U�$�,A=�K�����;����~�?�{���̸���P�m�i��u��F�sn���
�vƂ��.m�[�~3k.r�LG`�N�N���4��t�su93��l
�����6�wh8����"@�'Zw|���#�qʧl���)���p��R��p}A����H���Ϙ�ٙ�����ǻ�L]=�����2u\ �h��K��S�tݱ����~����f�����e��%S@G�i��h5��L���-���9�5k[�}�Ak���ZN+e�+�p�d�6.K*��<ֲ���;���Qd�NyDm�aM^�����|��ڙ&��#��(|��ݨ����yvO-�e)`y���e���8��՛���$�~
zz�Ɓ��4�z
�̫^Ĭ~�0/��<]质i���}[S"��ڶK��qغA�l��.1�]3k��Ua�C���tu(fL��C^Sɦ[���^w�Q���+s�hl]�{i."��^!Mx��� ����gi<,�m4{rK��	r��t��QC^D��6	�s�1���͜z��}�kX��~��dl�6��[,� �9Ʈ��k�z��k�O�]���,K��F�����������)�2U匘�å�A�x�M�&:|�)(l�DF#2b�>aK�"��R�8��}oR_�����s~f��STU�Ǉ��E�$.b�n�*r�5�P��f��,�=�L3ۼ��T��6��ig��X�?����X�Dn�z��,k�A�)x�8�$3��KW�0�Z��]��Yp��IU��U���Z�u��h�U*��2�YU�6��(E�ˠ�e@Ѕ�m+2��A^!Zu
�{�v#r��{w	Xx��3� ���N�D}<Hr:2	M���4�t�;��VM�A��"�blN� ���{3y.U��@�L�iT�$�T����j�B�Q�Ao�bE�JO��F¤����t�K�mȊ�����0/��6+���ZZ�r�&�љ*����Os�^Ie�-9.��t���1kW��uR����_(�F/HIj�9:)��5�
S��|Ԅ:&WzPݸ���_#�dy!���B\�bU��k�ps����8�z7s
��ӈ]}���l�XգnJD4N�A��[e~N��^��0�����i�wh�CS���F\UOZ��H�1�y(�ɮ�j1�������h��5�2-p꾊b�C�KLֹIE=EE�ъ�̈́��w�gz xkښ4-#��AΕN<]��x�#>2L�h���ҭL`xs2ІO5�.~��ʘ|7��Ɇ@}�$���jӬ��ԂV�-��M�tZX�R�ǌ
W:5w,����qGs�a^�I}��\ql����r��x�ђ����¿�6�}5u�7�=e�O��V��4�!=���.�VD����4��  ��z���D���E6�Y�>�l��>e;��譃�m�{׷��Í���<��XO19�!~_��,�v�+�"�$1�F90�(|���*�!��^d��[�^o�kۡ�lN���l#%ʝ�݂㼶��tC��G���{���3�v�`@�VB�LH��Q��\����ͪJ�5��m6;�?)��gl���)���{�����B�%��8��!.Hf��f���y�E��rӄ/���C�=��V_6�[<E��M;�0A�M�9����"��4绽D���,�C��Z�NTM��r�*���;pb��i�Ƹ�)g�\��H`4!ڛ�ҥ2�Q�����Qn�i�w�F{��í0��=v�6�K��֦K@�$ �)� R�dl��L6�A�9�1eLД4~��2�^�K"�GT|iw�Z�c�7⍊�R� 
�z^�
S�����켩���g�Ek���rLs�9��6=Q.Ôl�z?}���R�oza�;H-��8�c�ڽ��p!y>ك�a��'dj^d��h�=�^�fA�w>U�h~-���BMb����a��$�+�QS���� ���EY�=j���,��1�zA�kڦ�-�

%���Q����f�d0F�J�F�tQ����z^��am���F����ɧ.u.kʹM�J�ucN����/���������.���N���L��nb�����g�IM��v�� :�S��/����w�ci;����Ǆ�ZYR��ff��se�b|q9w#��1�q3�[o9:���3�/ֻ��@)���l	p��b���ٜ��KU�\?obBn�b��l���G憺5P�_uq�u��{�a��Zl��ɧv��Ȥ���M�U>yǱd�k�5ۏ��Mg~��[(NEQl�c��f��"�z�o�.A?n�״�H�2Hv�?Ƶ��V�tDc�c�r���9j�׬��E��:
q�n�xW�$�^�>ʢyw�!y����?F��ًm�_';��5�2T��HҦ|�gR��"1�^@# �v���SU���z��ڇN54���c�g�Qa@�^��Ll�nU�\�1}��ɶv��AX2}e�<�Y���E2�i��v�Ȫ<⻞�,�_���h?S�L}��� ���O��Oj�e
hi_�O�s@.
8nU/��eԽ�cF/{�<�w��q�f�̑�T��ӼH�a)[���E���c�l
��V`��
!#��vR��i�gBh���Ȏyw��.\]�FA,E7���]�yI��p�u
��vd���a�%��?\�K���݁�<3���;�� w��odlc��R��s��O�!������k�N&�J��aI:��@��m���g=��5�ޢA+�1�c�5���}F2r�6@�h�-~�x�H��}{s�[MI8fQ�|�0�(o�l'���_��&9,�(��}S|�^!d
+4�w����j��KҲ	���H�v-1��4���)n��kZ��[(F�s�}�6*�mQ��}�Ł���J�k�����s}p?�C��:�ev��ꧩ�X�%�_�{�/bߕ�c%���'hq�\�,/��C�A��
��,����,ɐa�Ɓi�A�ܓ���u!�Z9�)2��v��MIQ (XE�X/�5�#��c���ѱ�TB�O�*7g�`T���o�����+N���6����Qs�S���Y���^�u�_ ��t�����������UxH��Ҍ�0�٩u���<���0]/�4�T�^���"_v
أQd]��	�bF�Q�/O_T�����҉X��4�?wxg+�H@�CS�T��_R#��ɦ�� ��.gXW'|��䜳Rg�F�If�����w�o�¼�����+�?�ᢧ7�E�4����\���O�ȈFd�j�V�3F���&�\e��dƒ��]:)T�כ�QFk
'���2��\CJ#EnS2��t��R�,.�ݰ�\	7� �1�Vf�0����]_���Z�0?��Y\.py�3T�}���;�z��y���mU�Ӑ��{U�s`
*t2V_� �<����AX?lVK����}��5�I��-3�Z�D�i�
19=`d
���gз�LF,*+�
��E�I��l��Z3.������\�2ϼe�����p�R��h5��֕�05�'�)@���PV��4%ې� ����cF�j��f�z���2���N�^�4E%ը�z�b@3�i�����`ѫ�����Gt�ж�@t�Q}^G�����EM��D��+�<:]���"�i��*;ֶ�fZ�R�^��E(	j�ŜI����e�]z/ɓ�.��P��e�'���0d�!����K��c����J���<F5���SeMEo49O��jbM���l�!�`�w/�D����^�h���2���'4&�}䥺��:����~���K	ԑ��`4��,b�G�ӠڱxjwN�o���CMb(��wnS� �4Z��'���E����x�Tc�m��ӽ�˚���Çӷ����� �ځl�Oc���f6n��f��[�j���F��Y�{�i	�ʣC��    �����K�՝f�r
\�_\-��`���O[�p18��d��u��C)��y���;��#����8|3��as2�����8�7����W��]\�n|91b'���%���o�\��#��~���K;�E�ٴ��Y������'����k�M\:|�wu@dm�+�@ֆ����f�3O�Œ�=���=��B!�ܳ�"S��X����&����bC�pd.�K�~���f"`t��z���^	j>
ӈ�W�$(����!��F�gF�Af�}�M�3@�'@�D��U�~A�c����^hF"����oL�w��ű�8ؘNW!jo-c�C蚁��k�a�̓g��~u'"yM] ����A�<��C�Gw�9D�C��o�u��=`y�Ww�5��7�aи+��Y[x�_�̯�l���\G!b�oЀ� CJ�3^�se��5C��ߔ�#S�a'z�~��&K��S.�!�P}��3�[��l�2���(V+�+�24�f&�:ib���c{e5�^�k���K����eǖ���/'U�,�x|��Za�Y�?�՘���k�g����Jg$KL[���a�i:�!A�e�N@y?�T�T^Ǡێ.� dbB�G�K���j�&�x��I�ۓ�C�0G*Y!N�$��(��{��8��5}}��q̢;�*�v�8����>���Ѐle���Z�-z�Ѣ/8u$�ք��^x�%�x[�N�Q{}�x�L{`Z/q�v��)��ɷ�pYh���1]{<�4��w��8zv�:��RD�Ikm�=rґ���͜zMS0۪2S"�W��(I!���Z�}���/N>z*<\�#�̣�e!=JX�i�p�VJ%d�E�]qSk��䃻��I��ԤI�����4p�/��2�7���z
���T<Ĺ5u�$�zR�ߵ��$�����.:���wLu��2��^����J$�{V_�����kӳ���lw��-�/�!2�����b�Ɔ�}`&Q�?�k�
�?��M���	����+��M����g�H�n{�����@�SUd�YMg�Y.[������BW�ʋ.�ed90�{�צ�#By8�op�{��G\���<.KkA������Qz�>�X9|��<�&-%���mK�]���0�x�c�AK��/^�@�Ht�ʠ��Yc�8���=��A�;���_�̂�nP���I>W�Z[�J菊G�IO2rzu���v����p臨����[	.��i-�:�_n2�0h��ַ��K��U;�}01wG�8��O�Nw$r(���^�¼m0�(ȄmH�|��q'�J/P�As��$�I���f�����EXN���T�'� ����k1�0��+l'��K�-��)A���?�<{���~��l[4�+�*V��Ӹ�����:r�״��f�|^D|�<@KU
97�=��D)�6v:���V�%��R�}����:�x�z}mj!�C�l�*��[V����rz�)�w���*���&
����q�	1�@�h��Z�`rWҷm߅V��֋��
�%J�����@'�e��x�����3�~��'�x0����2��bY���/^M8{���kV�F�G-�:Q�����8���D2c�����G����U��P�����OV�:2q�W���ƃ�u����#����)���{���i>�6Θ�a�ɼZ���������&�+�A�����}H6�rL-����݌l/�8.N�;]�xGz�^�E`a�Td�/h{ЪDa�0���fi5	V�>$����
��
�%)$4CQ���\��D�%;W�3�&�Y�!��_՝}^��~D�q��2�v���� �Z�B�Y��\�֝��f�Da"��޲�e�7IǏ�&v���+s�	W�ipY<����]� ye1�Q�C)b�:�f��)�7����]����@8�龰��:�y�a�?��VqX���>c���NT�
�Ȑ�>GQRyI��r�@f�c�;lb}g߼h�&<T�V()�]i�OQYp��#]��æ[h/��/�l��6�?�/��f����/|_N�;�=u���q���3S`����]7�X�h�sD��Q�V�^�LM�I`�q(�x%�2� �����ni��B޹#�%�Y	~<���ǯ���**%�8}3�4��ȓ�F���i7���VBP$��_�7ϰ	\���d��g=Gn�|er������>��B��f�\�~����feO`��U��1���V���\�8�F���ӁM/��� .�p�0 F���<�x�~4{�����E���g���0<{��َ��� y�*Ēp���%Bz�Σ!V�	fK���&���g��j̀eiB���
���Lit9{��z�r�V�}M1�~^t2c1��zʢ�70L�[�q5*�B�د�c�̷;e$�W,@
��3(x�lӐD��h�D@�`��gu��� ܹ�o��b�C�I+��c�zn��y�8�\x$¹m��g�C/a��]��z1u�-��ʙXX��X���1=�q{e.��������)y�x�A@���3�/x�h�-u!�N"���u���i�\�<Ҁz=��"�99��`�*�% �4��c�t�h�fJ�,/C��{�_g����4�v9&R"���(ua�p)>���+����[�'�ɾA8�����`v˰t�斵<�w�,�����	���hj�hSy�z\v�!=�\�}Wf�X1�����:�Dά�qA&
��Ik�=��o�t7 4)S�g�sCx�������0,�YT��,������Ϳ�=�����u���M��}B`���O_Ǹ�%��e���$][(�l>h`���Μ�2a��=�1ΙuK���9dw��
�$�*i�ip�A��.�B�ԀL�|0�a���o(����綃g:�s�O��a��wYcT$�����i�
�I����Q84�_�\�RԪ��ԧ�!�ޕrP�ɂph�^��0�t5p�F�MM0�=gb��51�����M���I��j�Z�4Q�F�"���U���]�3�b����E�9i����{�-y\�JNjV'��� �'��~/��59����y���H���f���Kt�RL:KY��d1J���C��n��c�YxS]Z��W��1�O�,��ކǆ�}�.E����AG��|���$�/Ι�`�i�f��0Ċۮg�E�`�"��H�f�`�r��r�!�aː2�B$��e����6Z����ӈ�R�7j��nw�A@���A{����P��F܀��^M�e��њ��iY8�A)T���jC Ʋ�y�e9]� ��q� Z�bCZ�G|!��L�ܜf���IRTz�䍕R�RY6��vѣ�t�#,�+��k�������h*ԃQ�Þ���9kk�,�k�Xbt��{,#o���qa�J���a�,�`6�j��.�V��;-���g��J�X�7B���?=F���x��ڱ�mE�IW*z}T��>�ى�w�o��
.�~X-��Rt��%W�w�T<��;��ْl� sr���_(���e#/����M�RU�$�P�6�@T��c�MR(P�;T����ޣ��Γ�结�mu(��Z���`����ۼ�b�H�%f��d�e����냡|咋ּ9 /Ed}/#�B̡�jw(��n���B�Я���I~�yH��;�Ƹ�hL����e�Ձ'F�[�>�lH�db������K�.A��SP�Ϊ��i��4��,�К=��h�f��+5:�����}�/`Z���k���4�=���,�k��E��eQ )����BEhʜ��d#e줖��>��q��U+-L1(�J�h��'��d�2j����!��$똳��M=�7�S���fH�R��~�ɾ���R�Jb�3��"�~P���� ?)��
R��Ac���~��#��nf:��́i3��Q=�t(�b�AY��:f��P�"2���ⶵp9٘�` ��8�h�@q}3����@T��ܫ�	Bf�+�P��_ �  �''���7�Q	�lF2L�@���P�k~	{��i���h��`�e�w���'�q�u��ͣbߡ��N��U@4������G���a��$B�
��Iz��jӐ�d��R�L�Mx����-oov��-j�	�E���!�U���QU��K-�S,u���ck	�C�~3;�9����Q3�@Zh˒����]Ms{9�&�z92�%�1ӂ�e$kX��,���M��.,py��YwP�A�2����3v���������:o2��e'0�ƞ�
�*H.1e\�[�9�f���z�h�:U�jJ�c�\���M��$L�4)^��D�w8u��{�/�jy��^4���|)c^$���+�2�u��qK@�KcR��_��_�ui�����-���O�/� ڐRO"U����xk��2����i�*؞���F��#:
��!��١�Y�۰�M'�<(Xf�¦��%f `�Խe6�Eg��u���@,1�M��*\����D���J��U�/]]g��>Da6�Df��cZ&$�ᣚ���L
�������B��#��4D)��}�eJG�USYz��q�
g��;oF��,�UްB`��Md�dh6��d�@�K���:���|��ӥ5�����t_��q�T��r�W�����KS�$��ik%����5���w��#��!Xs5��9g��^��zRL>z�P��oF�|{��Tt\����!\�8��"	���,H��Ab�N�o6!ZƘi���>>��X���6�F������j�4�5ġ�i+C��̀���=�[�X	��B������n{�u@���7[U���mb�a��������)Ѝl�J�a�#�N�(F�B�P����gv�Ҿ��6a.�� ��+\�=���|�+�Q9M�2��hH���t/˓��k�4�E�����5�
�@��rg�K�����j���G�:E.��.�jR��r\�G���ϟ����姆?      
   �   x��=
1@�z�{q����H���	��$�����ϑ��Z>>x-�p.�\:�8�e&��p	>��6n(J�܄W�R�p&	����K���7S�H4O��3���q'CQ܃{R|2*�s�I뻾�3D�Ѥ2�     